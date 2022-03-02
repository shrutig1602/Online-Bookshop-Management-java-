<%@page import="project.ConnectionProvider" %>
<%@page import="java.sql.*" %>

<%
   String id=request.getParameter("id");
   
   try {
           Connection con=ConnectionProvider.getCon();
           Statement st=con.createStatement();
           ResultSet rs=st.executeQuery("select * from product where id='"+id+"'");
           while(rs.next())
           {
              String active=rs.getString(9);
              if(active.equals("YES"))
              {
                 response.sendRedirect("adminHome.jsp?msg=alreadyDone");
              }
              else
              {
                st.executeUpdate("update product set active='YES' where id='"+id+"'");
                response.sendRedirect("adminHome.jsp?msg=done");
              }
            
           }
       } catch (Exception e) {
           System.out.println(e);
//           response.sendRedirect("adminHome.jsp?msg=wrong");
       }
%>