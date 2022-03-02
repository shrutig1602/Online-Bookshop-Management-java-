<%@page errorPage="error.jsp" %>
<%@page import="project.ConnectionProvider" %>
<%@page import="java.sql.*" %>
<%@include file="header.jsp" %>



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
<title>My Cart</title>
<style>
    body{
        font-size: 1.6rem !important;
    }
    .orange-btn{
        border-radius: 15px;
        background: #f44336;
        color: #fff;
        font-size:2rem !important;
        font-weight: 700 !important;
        padding: 5px 68px !important;
        border-color: orange;
    }
    .orange-btn:hover{
        background: orange;
    }
    
   
    
    .btn-orange-outline{
        border-radius: 15px;
        color: #000;
        font-size:2rem !important;
        font-weight: 700 !important;
        padding: 5px 30px !important;
        background: #fff;
        border-color: orange;
    }
    
    .btn-orange-outline:hover{
        background: orange;
        color: #fff !important;
    }
    
    .f-big{
        font-size: 2rem !important;
    }
    
</style>
</head>
<body>
<div style="color: white; text-align: center; font-size: 30px;">My Cart <i class='fas fa-cart-arrow-down'></i></div>
<%
  String msg=request.getParameter("msg");
  if("notPossible".equals(msg))
  {
   %>
<div class="alert alert-primary alert-dismissible fade show text-center" role="alert">
  <strong>Oops!</strong> There is only one Quantity! So click on remove!
  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
    <span aria-hidden="true">&times;</span>
  </button>
</div>
    
   <%
  }
%>

<%
 if("inc".equals(msg))
 {
  %>
  <div class="alert alert-success alert-dismissible fade show text-center" role="alert">
  <strong>Yeyy!</strong> Quantity  Increased Successfully!
  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
    <span aria-hidden="true">&times;</span>
  </button>
</div>
 
  <%
 }
%>

<%
 if("outOfStock".equals(msg))
 {
  %>
  <div class="alert alert-danger alert-dismissible fade show text-center" role="alert">
  <strong>Oops!</strong> We have only these Many available!To add more,Stay tuned!!
  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
    <span aria-hidden="true">&times;</span>
  </button>
</div>
 
  <%
 }
%>


<%
 if("dec".equals(msg))
 {
  %>
  <div class="alert alert-warning alert-dismissible fade show text-center" role="alert">
  <strong>Oh No!</strong> Quantity  Decreased Successfully!
  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
    <span aria-hidden="true">&times;</span>
  </button>
</div>
  
  <%
 }
%>

<%
 if("remove".equals(msg))
 {
  %>
  <div class="alert alert-danger alert-dismissible fade show text-center" role="alert">
  <strong>Oh No!</strong> Product Successfully Removed!
  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
    <span aria-hidden="true">&times;</span>
  </button>
</div>
  
  <%
 }
%>

<div class="row mx-5">
    <div class="col-md-9 mt-4">
            <div class="small_container" style="border: 1px solid #e2e2e2">
                <h2 class="text-center p-3 m-3" style="background: #e2e2e2;color:#black; font-weight: 700">MY CART</h2>
                <div class="row_s">
                    
                      <%
                     int total=0;
    int sno=0;
 try {
        Connection con=ConnectionProvider.getCon();
        Statement st=con.createStatement();
        ResultSet rs=st.executeQuery("select * from product inner join cart on product.id=cart.product_id and cart.email='"+email+"'  and cart.address is NULL");
           while(rs.next())
           {
                    %>

                    <div class="col_3 product-card text-center p-3 mr-0.5">
                        <img src="img/books/<%=rs.getString(5)%>"  alt="">
                         <%
                           String name=rs.getString(2);
                           String res="";
                          String [] strs=name.split(" ");
                          if(strs.length>4)
                          {
                            
                            for(int i=0;i<4;i++)
                            {
                              res=res+strs[i]+" ";
                            }
                            name=res+"..."; 
                          }
                         %>
                         <h4 class="p-2"><b><%=rs.getString(6)%></b></h4>
                        <h4 class="p-2"><%out.println(name);%></h4>
                        
                        <div style="background: #FAFAFA;border-radius: 12px">
                            <h4 class="p-1">
                             Our Price :
                             <b>&#x20B9;<%=rs.getString(7)%></b>                                 
                        </h4>
                       
                             <h4>Items : <a style="padding: 3px;color: #000" href="incDecQuantityAction.jsp?id=<%=rs.getString(1)%>&quantity=dec"><i class='fas fa-minus'></i></a> <span style="border: 2px solid #e2e2e2;" class="p-2"><b><%=rs.getString(12)%> </b></span> <a style="padding: 3px;color: #000" href="incDecQuantityAction.jsp?id=<%=rs.getString(1)%>&quantity=inc"><i class="fas fa-plus"></i></a></h4>
                        <br>
                             <h4>Number of Items Selected Cost:<br><b>&#x20B9;<%=rs.getString(14)%></b></h4>
                             
                        </div>
                        
                        
                        <a class="btn p-2 btn-outline-success float-left ml-1 px-4" href="showMore.jsp?id=<%=rs.getString(1)%>">Show More</a>
                        <a class="btn btn-outline-danger float-right mr-1 px-4" href="removeFromCart.jsp?id=<%=rs.getString(1)%>">Remove</a>
                        
                        
                        
                    </div>	
                         <%
   }                       
                    %>
                </div>
            </div>
        </div>
                
                
                
         <div class="col-md-3 mt-4 ">
             
            <div class="list-group">
                <%
                ResultSet rs1=st.executeQuery("select sum(total) from cart where email='"+email+"' and address is NULL");
        while(rs1.next())
        {
          total=rs1.getInt(1);
        }
                %>
                <h4  class="list-group-item list-group-item-action active font-weight-bold f-big">PRICE TOTAL </h4>
               
                <h4  class="list-group-item font-weight-bold"><br>SUB TOTAL :  <i class="fas fa-rupee-sign"></i><b> <%out.println(total);%></b><br><br> DELIVERY CHARGES : <b>FREE</b><br><br></h4>
                <h4  class="list-group-item font-weight-bold "><br>AMOUNT PAYABLE : <i class="fas fa-rupee-sign"></i> <%out.println(total);%><br><br></h4>
                <li class="list-group-item text-center">
                    <br><a href="continueShopping.jsp" class="btn btn-orange-outline px-5"> < Continue Shopping</a>
               <br><br> </li>
                <% if(total != 0){ %>
                <li class="list-group-item text-center"><br>
                    <a href="addressPaymentForOrder.jsp"  class="btn orange-btn px-5 font-weight-bold">Place Order</a>
               <br><br> </li>
               <%}%>
            </div>
                
                <%
                }
catch(Exception e){
  System.out.println(e);
}
                %>
        </div>           
                
                
                
                
                
                
                
</div>


      <br>
      <br>
      <br>
      <br>
      <br>
      <br><br>
      <br>
      <br>
      
      
<%@include file="footer.jsp" %>      
</body>
</html>