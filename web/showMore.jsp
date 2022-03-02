<%@page import="project.ConnectionProvider" %>
<%@page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<link rel="stylesheet" href="css/homeAndHeader.css">
<title>Add / Change Address</title>
<style>


label,input{
        font-size: 1.5rem !important;
        font-weight: bold;
    }

</style>
</head>
<body >

<header>
     
             <div class="header-1">              
                 <a href="home.jsp"><i class='fas fa-arrow-circle-left' style="font-size: 2em;color: #990000">Back</i></a>
                 <a href="" class="logo"><i class="fas fa-book-reader"></i>bOOkbEEriEs</a>
                 
                 <span style="font-size: 2rem;font-weight: 700">SHOW MORE <i class="fas fa-book-reader" style="font-size: 2em;padding: 0.5em"></i> </span>
            
             </div>
</header>
<br><br><br><br>

<%
 String email=session.getAttribute("email").toString();
 String id=request.getParameter("id");
 try {
        Connection con=ConnectionProvider.getCon();
        Statement st=con.createStatement();

        ResultSet rs=st.executeQuery("select * from product where id='"+id+"'");  
        while(rs.next())
        {
          %>
   
         <div class="container  d-flex">       
             <div class="div1 m-5">
                 <img src="img/books/<%=rs.getString(5)%>" width="300px" height="300" alt="">
                   <h3 class="p-2 mt-5" style="color:red"><b><%=rs.getString(2)%></b></h3>
         <h4 class="p-2"><b>By<%=rs.getString(3)%></b></h4>
             </div>
         
             
             <div class="div2 m-5">
                 <div class="p-2 m-4" style="background: green;color: white;font-size: 1.5rem;display: inline"><b><%=rs.getString(6)%></b></div> <br>     
          
                 
                 
                 
                 <div style="font-weight: 700;color: #660066;font-size: 2rem;margin-top: 2rem">!! Description !!</div>
         <h4 class="p-2"><b><%=rs.getString(4)%></b></h4> 
         
          <h3 class="p-2"><span style="font-weight: 700;color: red;font-size: 2rem;margin-top: 2rem">Price :</span><b> <i class="fas fa-rupee-sign"></i><%=rs.getString(7)%></b></h3> 
             
          <h3 class="p-2"><span style="font-weight: 700;color: red;font-size: 2rem;margin-top: 2rem">Hurry Up Only These Many left :</span><b> <%=rs.getString(8)%></b></h3> 
             
             
             
             </div>
          
          
        
         
         
         </div> 
          <%
        }
 }
 catch(Exception e)
 {
 
 }
%>



    
    
    














<br>
                <br><br><br><br><br><br><br>
<%@include file="footer.jsp" %>
</body>
</html>