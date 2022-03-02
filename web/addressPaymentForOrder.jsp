<%@page import="project.ConnectionProvider" %>
<%@page import="java.sql.*" %>
<%@include file="footer.jsp" %>


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
<link rel="stylesheet" href="css/footer.css">
<title>My Cart</title>
<style>
    body{
        font-size: 1.6rem !important;
    }
</style>
<script>
    if(window.history.forward(1) != null)
    {
       window.history.forward(1); 
    }
        
</script>
</head>
<body >
<div style="color: #f60091; text-align: center; font-size: 30px;">Address Payment For Order<i class='fas fa-cart-arrow-down'></i></div>



<table class="table table-striped">
    <thead >
<%
    String email=session.getAttribute("email").toString();
    int total=0;
    int sno=0;
 try {
        Connection con=ConnectionProvider.getCon();
        Statement st=con.createStatement();
        ResultSet rs1=st.executeQuery("select sum(total) from cart where email='"+email+"' and address is NULL");
        while(rs1.next())
        {
          total=rs1.getInt(1);
        }
%>
          <tr>
            <th scope="col"><a href="myCart.jsp"><i class='fas fa-arrow-circle-left'> Back</i></a></th>
            <th scope="col" style="background-color: yellow;">Total: <i class="fa fa-inr"></i> <% out.println(total);%></th>
          </tr>
        </thead>
        <thead style="background:#f60091;color: #fff">
          <tr>
          <th scope="col">S.No</th>
          <th scope="col">Product Photo</th>
            <th scope="col">Product Name</th>
            <th scope="col">Category</th>
            <th scope="col"><i class="fa fa-inr"></i> price</th>
            <th scope="col">Quantity</th>
            <th scope="col">Sub Total</th>
          </tr>
        </thead>
        <tbody>
      
         <%
           ResultSet rs=st.executeQuery("select * from product inner join cart on product.id=cart.product_id and cart.email='"+email+"'  and cart.address is NULL");
           while(rs.next())
           {
         %>     
          <tr>
          <%sno=sno+1;%>
           <td><% out.println(sno);%></td>
           <td><img src="img/books/<%=rs.getString(5)%>"  height="60px" width="60px" alt=""></td>
            <td><%=rs.getString(2)%></td>
            <td><%=rs.getString(6)%></td>
            <td><i class="fa fa-inr"></i><%=rs.getString(7)%> </td>
            <td><%=rs.getString(12)%> </td>
            <td><i class="fa fa-inr"></i><%=rs.getString(14)%> </td>
            
          </tr>
<%
  }
 ResultSet rs2=st.executeQuery("select * from users where email='"+email+"'");
          while(rs2.next())
         {
%>
        </tbody>
      </table>
        
     <hr style="width: 100%;height: .3rem;border: 0 none;color:#222;background-color: #222">
     
     <h3 class="text-center" style="color:#f44336">SHIPPING DETAILS</h3>
     <form action="addressPaymentForOrderAction.jsp" method="post">
  <div class="row m-2">
    <div class="col m-2 text-center">
        <label for="name">Enter Name  </label>
      <input type="text" class="form-control" value="<%=rs2.getString(1)%>" id="name" placeholder="Enter name" name="name" required>
    </div>
    <div class="col m-2 text-center">
        <label for="mobileNumber">Mobile Number </label>
        <input class="form-control" id="mobileNumber" type="text" name="mobileNumber" value="<%=rs2.getString(6)%>"  placeholder="enter Mobile Number" required>           
    </div>
  </div>
    
    <div class="row m-2">
    <div class="col m-2 text-center">
        <label for="address">Enter Address </label>
      <input type="text" class="form-control" value="<%=rs2.getString(8)%>" id="address" placeholder="Enter address" name="address" required>
    </div>
    <div class="col m-2 text-center">
        <label for="city">Enter City </label>
        <input type="text"  value="<%=rs2.getString(9)%>" id="city" class="form-control" placeholder="Enter city" name="city" required>
    </div>
  </div>
    
    <div class="row m-2">
    <div class="col m-2 text-center">
        <label for="state">Enter State </label>
      <input type="text" class="form-control" value="<%=rs2.getString(10)%>"  id="state" placeholder="Enter state" name="state" required>
    </div>
    <div class="col m-2 text-center">
        <label for="country">Enter Country </label>
        <input type="text" id="country" value="<%=rs2.getString(11)%>" class="form-control" placeholder="Enter country" name="country" required>
    </div>
  </div>
    <br><br>
    

        
        <div class="text-center p-2">
            <button class="btn btn-outline-success btn-lg px-5 py-3" type="submit">Proceed To Generate Bill & Save <i class='far fa-arrow-alt-circle-right'></i></button>
    
        </div>
       



</form>
        
        
        
        
        
        
        
        
<%
  }
}
catch(Exception e)
{

}
%>        
      <br>
      <br>
      <br>

</body>
</html>