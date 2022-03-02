<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
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
<style>
    body{
        font-size: 1.6rem !important;
    }
</style>
<title>My Orders</title>
</head>
<body>
    
   
    
    <div>
         <h2 class="text-center p-3 m-3" style="background: #e2e2e2;color:#f44336; font-weight: 700">!!  ORDER HISTORY  !!</h2>
    </div>
    
    
    
     <div class="col-md-12">
            <div class="small_container" >
                <div class="row_s">
                    <%
                       try{
            Connection con=ConnectionProvider.getCon();
            Statement st=con.createStatement();
            ResultSet rs=st.executeQuery("select * from cart inner join product where cart.product_id=product.id and cart.email='"+email+"' and cart.orderDate is not NULL");
           while(rs.next())
           {
                    %>




                    <div class=" product-card  p-3 m-5" style="border:0.3px solid #ccccff">
                        <img src="img/books/<%=rs.getString(18)%>"  alt="">


                       <%
                           String name=rs.getString(15);
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
                         <h4 class="p-2" style="color:red"><b><%=rs.getString(19)%></b></h4>
                        <h4 class="p-2"><%out.println(name);%></h4>
                        <br>
                        <h4 class="p-2"><b>Product Price : </b>&#x20B9;<%=rs.getString(4)%></h4>
                        <h4 class="p-2"><b>Quantity : </b><%=rs.getString(3)%></h4>
                        <br><h4 class="p-2"><b>Total Price : </b>&#x20B9;<%=rs.getString(5)%></h4>
                        
                        <%
                        String oDate=rs.getString(11).toString().substring(0, 10);
                        String dDate=rs.getString(12).toString().substring(0, 10);
                        %>
                        
                        <h4 class="p-2"><b style="color:green">Order Date : </b><%out.println(oDate);%></h4>
                        <h4 class="p-2"><b style="color:green">Expected Delivery Date : </b><%out.println(dDate);%></h4>
                        
                        <h4 class="p-2" style="font-size:1.6em"><b style="color:green;">Delivery Status : </b><%=rs.getString(13)%></h4>
                    </div>		
                    <%
   }
}
catch(Exception e){
  System.out.println(e);
}

                       
                    %>

                </div>
            </div>
        </div>
    
    
    
    
    
    
 <br>
 <br>
 <br>
 <%@include file="footer.jsp" %>
</body>
</html>