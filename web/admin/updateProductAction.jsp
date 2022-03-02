<%@page import="project.ConnectionProvider" %>
<%@page import="java.sql.*" %>

<%
   String id=request.getParameter("id");
   String name= request.getParameter("name");
   String authorName= request.getParameter("authorName");
   String description= request.getParameter("description");
   String category= request.getParameter("category");
   String price= request.getParameter("price");
   String stock= request.getParameter("stock");
   
   try {
           Connection con=ConnectionProvider.getCon();
           Statement st=con.createStatement();
           ResultSet rs=st.executeQuery("select * from product where id='"+id+"'");
           while(rs.next())
           {
             st.executeUpdate("update product set name='"+name+"',authorName='"+authorName+"',description='"+description+"',category='"+category+"',price='"+price+"',stock='"+stock+"'  where id='"+id+"'");
             response.sendRedirect("adminHome.jsp?msg=done");
           }
       } catch (Exception e) {
          
//        response.sendRedirect("editProduct.jsp?msg=wrong");
         System.out.println(e);
       }
%>