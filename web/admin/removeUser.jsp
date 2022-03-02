<%@page import="project.ConnectionProvider" %>
<%@page import="java.sql.*" %>

<%
   String email=request.getParameter("email");
   
   try {
           Connection con=ConnectionProvider.getCon();
           Statement st=con.createStatement();
           st.executeUpdate("delete from users where email='"+email+"'");
           st.executeUpdate("delete from cart where email='"+email+"' and status='Processing'");
           response.sendRedirect("userDetailsAndDeletion.jsp?msg=remove");
       } catch (Exception e) {
           System.out.println(e);
//           response.sendRedirect("adminHome.jsp?msg=wrong");
       }
%>