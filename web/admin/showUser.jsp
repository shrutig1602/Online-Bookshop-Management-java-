<%@page errorPage="../error.jsp" %>
<%@page import="project.ConnectionProvider" %>
<%@page import="java.sql.*" %>



<html>
<head>
    <link rel="stylesheet" href="../css/homeAndHeader.css">
<link rel="stylesheet" href="../css/addNewProductStyle.css">

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<title>View User</title>
</head>
<body>
    
    

    
    <header>
     
             <div class="header-1">              
                 <a href="userDetailsAndDeletion.jsp"><i class='fas fa-arrow-circle-left' style="font-size: 2em;color: #990000">Back</i></a>
                 <a href="" class="logo"><i class="fas fa-book-reader"></i>bOOkbEEriEs</a>
                 
                 <span style="font-size: 2rem;font-weight: 700">USER DETAILS <i class="fas fa-book" style="font-size: 2em;padding: 0.5em"></i>  </span>
            
             </div>
</header>
    
    <br>
 
    
    
 
    
    <table class="table table-bordered">
    <thead style="background:#f44336;color: white">
          <tr>
            <th scope="col">S.No</th>
            <th scope="col">User Name</th>
            <th scope="col">User Email</th>
            <th scope="col">Gender</th>
            <th scope="col">Mobile Number</th>
            <th scope="col">Address</th>
            <th scope="col">City</th>
            <th scope="col">State</th>
            <th scope="col">Country</th>
            
              
          </tr>
        </thead>
        <tbody>
<%
 String email=request.getParameter("email");
 int sno=0;
 try {
        
         Connection con=ConnectionProvider.getCon();
         Statement st=con.createStatement();
         ResultSet rs=st.executeQuery("select * from users where email='"+email+"'");
         while(rs.next())
         {
          sno=sno+1;
       
%>
          <tr>
            <td><% out.println(sno);%></td>
            
            <td><%=rs.getString(1)%></td>
            <td><%=rs.getString(2)%></td>
            <td><%=rs.getString(3)%></td>
            <td><%=rs.getString(6)%></td>
            <td><%=rs.getString(8)%></td>
            <td><%=rs.getString(9)%></td>
            <td><%=rs.getString(10)%></td>
            <td><%=rs.getString(11)%></td>
            
            
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