<%@page import="project.ConnectionProvider" %>
<%@page import="java.sql.*" %>

<%
   String id=request.getParameter("id");
   String email=request.getParameter("email");
   String quantity=request.getParameter("quantity");
   String oDate=request.getParameter("orderDate");
  String status="Cancelled";
  
try {
        Connection con=ConnectionProvider.getCon();
        Statement st=con.createStatement();
        st.executeUpdate("update cart set status='"+status+"' where product_id='"+id+"' and email='"+email+"' and quantity='"+quantity+"' and orderDate='"+oDate+"'  and address is not NULL");
        response.sendRedirect("orderReceived.jsp?msg=cancel");
    } catch (Exception e) {
        System.out.println(e);
        response.sendRedirect("orderReceived.jsp?msg=wrong");
    }
%>