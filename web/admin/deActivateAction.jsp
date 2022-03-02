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
                 st.executeUpdate("update product set active='NO' where id='"+id+"'");
                 st.executeUpdate("delete from cart where product_id='"+id+"' and address is NULL");
                response.sendRedirect("adminHome.jsp?msg=done");
              }
              else
              {
                response.sendRedirect("adminHome.jsp?msg=alreadyDone");
              }
            
           }
       } catch (Exception e) {
           System.out.println(e);
//           response.sendRedirect("adminHome.jsp?msg=wrong");
       }
%>