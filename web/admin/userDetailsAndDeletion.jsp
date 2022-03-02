<%@page errorPage="../error.jsp" %>
<%@page import="project.ConnectionProvider" %>
<%@page import="java.sql.*" %>



<html>
<head>
    <link rel="stylesheet" href="../css/homeAndHeader.css">
<!--<link rel="stylesheet" href="../css/addNewProductStyle.css">-->

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<title>View/Add/Delete User</title>
</head>
<body>
      <%
           response.setHeader("Cache-Control","no-cache, no-store, must-revalidate");
        %>
        
    
    <%
     String email=session.getAttribute("email").toString();
    %>
    
    <header>
     
             <div class="header-1">              
                 <a href="adminHome.jsp"><i class='fas fa-arrow-circle-left' style="font-size: 2em;color: #990000">Back</i></a>
                 <a href="" class="logo"><i class="fas fa-book-reader"></i>bOOkbEEriEs</a>
                 
                 <span style="font-size: 2rem;font-weight: 700">VIEW USERS<i class="fas fa-book" style="font-size: 2em;padding: 0.5em"></i>  </span>
            
             </div>
</header>
    
    <br>
 
    
    
<%
        String msg=request.getParameter("msg");
 if("remove".equals(msg))
 {
  %>
  <div class="alert alert-success alert-dismissible fade show text-center" role="alert">
   User Successfully Removed!
  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
    <span aria-hidden="true">&times;</span>
  </button>
</div>
  
  <%
 }
%>
    
    
    
    
    
    
    
    <table class="table table-bordered">
    <thead style="background:#f44336;color: white">
          <tr>
            <th scope="col">S.No</th>
            <th scope="col">User Details</th>
            <th scope="col">Remove Users</th>
            
              
          </tr>
        </thead>
        <tbody>
<%
 int sno=0;
 try {
        
         Connection con=ConnectionProvider.getCon();
         Statement st=con.createStatement();
         ResultSet rs=st.executeQuery("select * from users");
         while(rs.next())
         {
          sno=sno+1;
       
%>
          <tr>
            <td><% out.println(sno);%></td>
            
            <td><a href="showUser.jsp?email=<%=rs.getString(2)%>"><%=rs.getString(1)%></a></td>
            <td><a href="removeUser.jsp?email=<%=rs.getString(2)%>">Remove <i class='fas fa-trash-alt'></i></a></td>
            
            </tr>
            <%
             }
 } catch (Exception e) {
         System.out.println(e);
     }     
            %>
      
        </tbody>
      </table>
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    

<br><br><br><br><br><br>


<%@include file="../footer.jsp" %>
</body>
</html>