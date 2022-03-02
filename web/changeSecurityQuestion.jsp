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


label,input{
        font-size: 1.5rem !important;
        font-weight: bold;
    }
    
    select{
        font-size: 1.5rem !important;
        font-weight: bold;
        height: 2.4em !important;
    }

</style>
</head>
<body style="background: #ced4da">

    
    <header>
     
             <div class="header-1">              
                 <a href="home.jsp"><i class='fas fa-arrow-circle-left' style="font-size: 2em;color: #990000">Back</i></a>
                 <a href="" class="logo"><i class="fas fa-book-reader"></i>bOOkbEEriEs</a>
                 
                 <span style="font-size: 2rem;font-weight: 700">CHANGE SECURITY QUESTION <i class="fas fa-question-circle" style="font-size: 2em;padding: 0.5em"></i></span>
            
             </div>
</header>
    
    
    
    

<%
 String msg=request.getParameter("msg");
 if("done".equals(msg))
 {
  %>
  <div class="alert alert-success alert-dismissible fade show text-center" role="alert">
  <strong>Yeyy!</strong>Your security Question successfully changed !
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
  <strong>Oops!</strong> Your Password is wrong!
  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
    <span aria-hidden="true">&times;</span>
  </button>
</div>
 
  <%
 }
%>    
    
    
    
    
    
    
    
    

<br>







<div class="container">
    <form action="changeSecurityQuestionAction.jsp" method="post">
    
<div class="form-group text-center m-5">
    <label for="securityQuestion">Select Your New Security Question</label>
    <select class="form-control" id="securityQuestion" name="securityQuestion">
    <option value="What was your first car ?">What was your first car ?</option>
    <option value="What is the name of your first pet ?">What is the name of your first pet ?</option>
    <option value="What is the name of the town where you were born?">What is the name of the town where you were born?</option>
</select> 
  </div>
    <hr style="width: 100%;background: #222">
    
  <div class="form-group text-center m-5">
    <label for="newAnswer">Enter Your New Answer</label>
    <input type="text" class="form-control form-control-lg" id="newAnswer" name="newAnswer" placeholder="Enter Your New Answer">   
  </div>
   <hr style="width: 100%;background: #222"> 
   
  <div class="form-group text-center m-5">
    <label for="password">Enter Password (For Security)</label>
    <input type="password" class="form-control form-control-lg" id="password" name="password" placeholder="Enter Password (For Security)">   
  </div>
    <hr style="width: 100%;background: #222">
    
    <div class="text-center">
        <button type="submit" class="btn btn-success px-5" style="color: #fff;font-size: 2rem">SAVE <i class='far fa-arrow-alt-circle-right'></i></button>
    </div>
    
  
</form>
</div>




<br>
                <br><br><br><br><br><br><br>
<%@include file="footer.jsp" %>
</body>
</html>