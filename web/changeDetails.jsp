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
<title>Change Details</title>
<style>
hr
{width:70%;}</style>
</head>
<body style="background: #ced4da">
<%
    
  String email=session.getAttribute("email").toString();
 try {
         Connection con=ConnectionProvider.getCon();
         Statement st=con.createStatement();
         ResultSet rs=st.executeQuery("select * from users where email='"+email+"'");
         while(rs.next())
         {
         
   
%>

<header>
     
             <div class="header-1">              
                 <a href="home.jsp"><i class='fas fa-arrow-circle-left' style="font-size: 2em;color: #990000">Back</i></a>
                 <a href="" class="logo"><i class="fas fa-book-reader"></i>bOOkbEEriEs</a>
                 
                 <span style="font-size: 2rem;font-weight: 700">YOUR PROFILE <i class="fas fa-user-circle" style="font-size: 2em;padding: 0.5em"></i></span>
            
             </div>
</header>
<br><br><br><br>
<div class=" text-center m-auto" >
    <h3 class="m-2 p-4"><b>Name: </b><%=rs.getString(1)%> </h3>
<hr style="width: 100%;">
<h3 class="m-2 p-4"><b>Email: </b><%=rs.getString(2)%> </h3>
 <hr style="width: 100%;">
 <h3 class="m-2 p-4"><b>Mobile Number: </b><%=rs.getString(6)%> </h3>
 <hr style="width: 100%;">
 <h3 class="m-2 p-4"><b>Security Question: </b><%=rs.getString(4)%> </h3>
<hr style="width: 100%;">
<h3 class="m-2 p-4"><b>Address: </b><%=rs.getString(8)%> ,<%=rs.getString(9)%> , <%=rs.getString(10)%> ,<%=rs.getString(11)%></h3>
<hr style="width: 100%;">
</div>


      <br>
      <br>
      <br>
<%
      }
     } catch (Exception e) {
   System.out.println(e);
     }
%>




<br>
                <br><br><br><br><br><br><br>
<%@include file="footer.jsp" %>
</body>
</html>