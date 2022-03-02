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
<title>Change Password</title>
<style>
hr
{width:70%;}

label,input{
        font-size: 2rem !important;
    }

</style>
</head>
<body style="background: #ced4da">

<header>
     
             <div class="header-1">              
                 <a href="home.jsp"><i class='fas fa-arrow-circle-left' style="font-size: 2em;color: #990000">Back</i></a>
                 <a href="" class="logo"><i class="fas fa-book-reader"></i>bOOkbEEriEs</a>
                 
                 <span style="font-size: 2rem;font-weight: 700">CHANGE PASSWORD <i class="fas fa-unlock" style="font-size: 2em;padding: 0.5em"></i></span>
            
             </div>
</header>
<br><br><br><br>



<%
 String msg=request.getParameter("msg");
 if("notMatch".equals(msg))
 {
   %>
   <div class="alert alert-danger alert-dismissible fade show text-center" role="alert">
  <strong>Oops!</strong> New password and Confirm password does not match!
  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
    <span aria-hidden="true">&times;</span>
  </button>
</div>
     
   <%
 }
%>

<%
 if("wrong".equals(msg))
 {
   %>
   <div class="alert alert-danger alert-dismissible fade show text-center" role="alert">
  <strong>Oops!</strong> Your old Password is wrong!
  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
    <span aria-hidden="true">&times;</span>
  </button>
</div>
     
     
   <%
 }
%>

<%
 if("done".equals(msg))
 {
   %>
    <div class="alert alert-success alert-dismissible fade show text-center" role="alert">
  <strong>Yeyy!</strong>Password change successfully!
  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
    <span aria-hidden="true">&times;</span>
  </button>
</div>
 
   <%
 }
%>

<%
 if("invalid".equals(msg))
 {
   %>
   <div class="alert alert-danger alert-dismissible fade show text-center" role="alert">
  <strong>Oops!</strong> Some thing went wrong! Try again!
  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
    <span aria-hidden="true">&times;</span>
  </button>
</div>
     
   <%
 }
%>




<div class="container">
<form action="changePasswordAction.jsp" method="post">
    
<div class="form-group text-center m-5">
    <label for="oldPassword">Your Old Password</label>
    <input type="password" class="form-control form-control-lg" id="oldPassword" name="oldPassword" placeholder="Enter Your Old Password">   
  </div>
    <hr style="width: 100%;background: #222">
  <div class="form-group text-center m-5">
    <label for="newPassword">Your New Password</label>
    <input type="password" class="form-control form-control-lg" id="newPassword" name="newPassword" placeholder="Enter Your New Password">   
  </div>
   <hr style="width: 100%;background: #222"> 
  <div class="form-group text-center m-5">
    <label for="confirmPassword">Confirm Your New Password</label>
    <input type="password" class="form-control form-control-lg" id="confirmPassword" name="confirmPassword" placeholder="Enter Your New Password">   
  </div>
    <hr style="width: 100%;background: #222">
    
    <div class="text-center">
        <button type="submit" class="btn btn-success px-5" style="color: #fff;font-size: 2rem;">Submit</button>
    </div>
</form>
</div>




<br>
                <br><br><br><br><br><br><br>
<%@include file="footer.jsp" %>
</body>
</html>