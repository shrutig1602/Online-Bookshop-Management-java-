
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="css/register-login.css">
        <title>Sign In</title>
    </head>
    <body>
        
        <div class="signup">
            <div class='whysign'>
                <%
  String msg=request.getParameter("msg");
  if("notexist".equals(msg))
  {
      %> 
      <div class="alert" style="background-color: red;">
  <span class="closebtn" onclick="this.parentElement.style.display='none';">&times;</span> 
   Incorrect Username or Password !!
</div>
      <%
 }
%>

<%
 if("invalid".equals(msg))
 {
   %>
     <div class="alert" style="background-color: #f44336;">
  <span class="closebtn" onclick="this.parentElement.style.display='none';">&times;</span> 
  Some thing Went Wrong! Try Again !
</div>
    
   <%
 }
%>
            </div>
            <h1>Sign In</h1>
            <form action="loginAction.jsp" method="post">
              
                <div class="text-field">
                    <input type="email" name="email" placeholder="Enter email" required>
                </div> 
                            
                <div class="text-field">
                    <input type="password" name="password" placeholder="Enter password" required>
                </div> 
                     
                <div class="pass"><a href="forgotPassword.jsp">Forgot Password</a></div>
                    <input type="submit" value="Sign In">
           </form>
            <div class="login_link"> Don't have an account ?<a href="register.jsp">Sign Up</a></div>
        </div>
    </body>
</html>
