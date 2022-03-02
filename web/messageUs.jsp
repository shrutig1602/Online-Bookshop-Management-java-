<%@page import="project.ConnectionProvider" %>
<%@page import="java.sql.*" %>
<%@include file="header.jsp" %>



<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

        <link rel="stylesheet" href="css/homeAndHeader.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
        <title>Message Us</title>
        <style>


label,input,textarea{
        font-size: 1.5rem !important;
        font-weight: bold;
    }
    
  

</style>
    </head>
    <body style="background: #ced4da">
 
        
        
<%
 String msg=request.getParameter("msg");
 if("sent".equals(msg))
 {
   %>
   <div class="alert alert-success alert-dismissible fade show text-center" role="alert">
  <strong>Yeyy!</strong>Message Sent Successfully  ! We will Contact You through Email !! Thank You!!
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
   <div class="alert alert-success alert-dismissible fade show text-center" role="alert">
  <strong>Oops!</strong>Some thing Went Wrong! Try Again!
  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
    <span aria-hidden="true">&times;</span>
  </button>
</div>
   <%
 }
%>        
        
        
        
        
        
        
        
        <div class="container">
            <form action="messageUsAction.jsp" method="post">
                
              
                
                <div class="form-group text-center m-5">
                    <label for="exampleFormControlInput1">Enter Subject</label>
                    <input type="text" class="form-control form-control-lg" id="exampleFormControlInput1" placeholder="Enter Your Subject" name="mSubject" required>
                </div>

                <div class="form-group text-center m-5">
                    <label for="exampleFormControlTextarea1">Enter Description</label>
                    <textarea class="form-control form-control-lg" id="exampleFormControlTextarea1" rows="8" placeholder="Description Here" name="mDesc" required></textarea>
                </div>
                
                <div class="text-center">
        <button type="submit" class="btn btn-success px-5" style="color: #fff;font-size: 2rem">SEND YOUR QUERY <i class='far fa-arrow-alt-circle-right'></i></button>
    </div>
            </form>  
        </div>
        

                    


    
                    
                    
                    
                    
                    
                <br>
                <br><br><br><br><br><br><br><br><br>
<%@include file="footer.jsp" %>
    </body>
</html>