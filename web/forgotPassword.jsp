
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="css/register-login.css">
        <title>Forgot Password</title>
    </head>
    <body>
        
        <div class="signup">
            <div class='whysign'>
                <%
  String msg=request.getParameter("msg");
  if("done".equals(msg))
  {
      %> 
      <div class="alert" style="background-color: greenyellow;">
  <span class="closebtn" onclick="this.parentElement.style.display='none';">&times;</span> 
   Password Changed Successfully!!
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
            <h1>Reset Password</h1>
            <form action="forgotPasswordAction.jsp" method="post">
                
                <div class="text-field">
                    <input type="email" name="email" placeholder="Enter email" required>
                </div> 
                
                <div class="text-field">
                    <input type="number" name="mobileNumber" placeholder="Enter Mobile Number" required>
                </div> 
                
                <div class="text-field">
                    <select name="securityQuestion">
                        <option value="What was your first car ?">What was your first car ?</option>
                        <option value="What is the name of your first pet ?">What is the name of your first pet ?</option>
                        <option value="What is the name of the town where you were born?">What is the name of the town where you were born?</option>
                    </select>
                </div>  
                
                
                <div class="text-field">
                    <input type="text" name="answer" placeholder="enter answer" required>
                </div> 
                
                <div class="text-field">
                    <input type="password" name="newPassword" placeholder="Enter New password" required>
                </div> 
                     
                    
                    <input type="submit" value="Save">
           </form>
            <div class="login_link"> Now let's login?<a href="login.jsp">Login</a></div>
        </div>
    </body>
</html>
