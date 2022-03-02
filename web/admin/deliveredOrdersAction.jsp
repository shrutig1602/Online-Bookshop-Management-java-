<%@page import="project.ConnectionProvider" %>
<%@page import="java.sql.*" %>

<%
   String id=request.getParameter("id");
   String email=request.getParameter("email");
   String quantity=request.getParameter("quantity");
   String oDate=request.getParameter("orderDate");
   int stock=0;
   int newStock=0;
  String status="Delivered";
  
try {
        Connection con=ConnectionProvider.getCon();
        Statement st=con.createStatement();
        st.executeUpdate("update cart set status='"+status+"' where product_id='"+id+"' and email='"+email+"' and quantity='"+quantity+"'  and orderDate='"+oDate+"' and address is not NULL");
        
        
        int quan=Integer.parseInt(quantity);
        
        
        ResultSet rs=st.executeQuery("select * from product where id='"+id+"'");
        while(rs.next())
        {
        stock=rs.getInt(8);
        newStock=stock-quan;
        st.executeUpdate("update product set stock='"+newStock+"' where id='"+id+"'");
        }
        
        response.sendRedirect("orderReceived.jsp?msg=delivered");
    } catch (Exception e) {
        System.out.println(e);
        response.sendRedirect("orderReceived.jsp?msg=wrong");
    }
%>