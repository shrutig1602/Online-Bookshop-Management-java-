
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="css/register-login.css">
        <title>Sign Up</title>
    </head>
    <body>
        
        <div class="signup">
            <div class='whysign'>
                <%
  String msg=request.getParameter("msg");
  if("valid".equals(msg))
  {
      %> 
      <div class="alert" style="background-color: greenyellow;">
  <span class="closebtn" onclick="this.parentElement.style.display='none';">&times;</span> 
   Successfully Registered!!
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
            
            <h1>Sign Up</h1>
            <form action="registerAction.jsp" method="post">
                <div class="text-field">
                    <input type="text" name="name" placeholder="Enter name" required>
                </div> 
                
                <div class="text-field">
                    <input type="email" name="email" placeholder="Enter email" required>
                </div> 
                
                <div class="text-field">
                    <select name="gender" required>
                        <option value="Male">Male</option>
                        <option value="Female">Female</option>
                        <option value="Other">Other</option>
                    </select>
                </div> 
                
                <div class="text-field">
                    <input type="number" name="mobilenumber" placeholder="Enter Mobile Number" required>
                </div> 
                
                <div class="text-field">
                    <select name="securityQuestion" required>
                        <option value="What was your first car ?">What was your first car ?</option>
                        <option value="What is the name of your first pet ?">What is the name of your first pet ?</option>
                        <option value="What is the name of the town where you were born?">What is the name of the town where you were born?</option>
                    </select>
                </div> 
                
                <div class="text-field">
                    <input type="text" name="answer" placeholder="Enter answer" required>
                </div> 
                
                
                <div class="text-field">
                    <input type="password" name="password" placeholder="Create password" required>
                </div> 
                     
                    
                    <input type="submit" value="Sign Up">
           </form>
            <div class="login_link"> Already a Member ?<a href="login.jsp">Login</a></div>
        </div>
    </body>
</html>
