<%@page errorPage="error.jsp" %>
<%@page import="project.ConnectionProvider" %>
<%@page import="java.sql.*" %>




<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<title>My Bill</title>
<style>
    .card-header{
        font-size: 1.4rem;
    }
</style>
</head>
<body>
 <%
  String email=session.getAttribute("email").toString();
  
      
      try{
          int total=0;
          int sno=0;
       Connection con=ConnectionProvider.getCon();
          Statement st=con.createStatement();    
          ResultSet rs3=st.executeQuery("select sum(total) from cart where email='"+email+"' and status='bill'");
          while(rs3.next())
          {
           total=rs3.getInt(1);
          }
          
 ResultSet rs2=st.executeQuery("select * from users inner join cart on cart.email='"+email+"' and cart.email=users.email and cart.status='bill'");
          while(rs2.next())
          {
 %>   
 
 
 <div class="alert container mt-4 text-center" style="color:white;background-color: #41A317;padding: 15px;font-size: 20px">
  <strong>Thank You For Shopping!!</strong> Your Order is Confirmed
</div>
 
 
 
  <h3 class="text-center mt-3">Shipping Details</h3>
    
<div class="card-deck container m-auto">
      
  <div class="card bg-light mb-3" style="max-width: 18rem;">
  <div class="card-header">Billing Address</div>
  <div class="card-body">
      <p ><b><%=rs2.getString(1)%></b><br>
          <%=rs2.getString(8)%><br>
      <%=rs2.getString(9)%><br>
      <%=rs2.getString(10)%><br>
      <%=rs2.getString(11)%><br>
      <b>Mobile No. : <%=rs2.getString(6)%></b></p>
      
      
  </div>
</div>
  
    <div class="card bg-light mb-3" style="max-width: 18rem;">
  <div class="card-header">Payment Method</div>
  <div class="card-body">
    
      <p class="card-text"><b>CASH ON DELIVERY(COD)</b></p>
  </div>
</div>
  
    <div class="card bg-light mb-3" style="max-width: 18rem;">
  <div class="card-header">Delivery Details</div>
  <div class="card-body">
      <p><b>Order Date :<br> </b><%=rs2.getString(22)%><br>
          <br>
          <b>Expected Delivery Date: <br></b><%=rs2.getString(23)%></p>
  </div>
</div>
  <%break;}%>
  
  
  
  <%
  ResultSet rs=st.executeQuery("select * from shippingInfo where email='"+email+"'");
          while(rs.next())
          {
  %>
    <div class="card bg-light mb-3" style="max-width: 18rem;">
  <div class="card-header">Shipping Address</div>
  <div class="card-body">
   <p ><b><%=rs.getString(2)%></b><br>
          <%=rs.getString(4)%><br>
      <%=rs.getString(5)%><br>
      <%=rs.getString(6)%><br>
      <%=rs.getString(7)%><br>
      <b>Mobile No. : <%=rs.getString(3)%></b></p>
  </div>
</div>
    
    <%break;}


    %>
</div>    





<div class="container my-5">
 <table class="table table-striped bg-light ">
<h3 class="text-center">Order Summary</h3>
  <tr>
    <th>S.No</th>
    <th>Product Photo</th>
    <th>Product Name</th>
    <th>category</th>
    <th><i class="fa fa-inr"></i>Price</th>
    <th>Quantity</th>
     <th>Sub Total</th>
  </tr>
  
  <%
   ResultSet rs1=st.executeQuery("select * from cart inner join product where cart.product_id=product.id and cart.email='"+email+"' and cart.status='bill'");
   while(rs1.next())
   {
     sno=sno+1;    
   
  %>
  
  <tr>
    <td><%out.println(sno);%></td>
    <td><img src="img/books/<%=rs1.getString(18)%>" height="60px" width="60px"></td>
    <td><%=rs1.getString(15)%></td>
    <td><%=rs1.getString(19)%></td>
    <td><i class="fa fa-inr"></i><%=rs1.getString(20)%></td>
    <td><%=rs1.getString(3)%></td>
     <td><i class="fa fa-inr"></i><%=rs1.getString(5)%></td>
  </tr>
  <tr>
<%}%>
</table>   
</div>

<h3 class="text-center m-3" style="color:#f44336">Total: <i class="fa fa-inr"></i><% out.println(total); %></h3>

<div class="text-center my-5">
    <a href="continueShopping.jsp"><button class="btn btn-lg btn-primary">Continue Shopping</button></a>
<a onclick="window.print();"><button class="btn btn-lg btn-success">Print</button></a>
</div>



<%
}catch(Exception e)
{

System.out.println(e);
}
%>


</body>
</html>