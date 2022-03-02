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
<title>message Received</title>
</head>
<body>
    
    
    <%
     String email=session.getAttribute("email").toString();
    %>
    
    <header>
     
             <div class="header-1">              
                 <a href="adminHome.jsp"><i class='fas fa-arrow-circle-left' style="font-size: 2em;color: #990000">Back</i></a>
                 <a href="" class="logo"><i class="fas fa-book-reader"></i>bOOkbEEriEs</a>
                 
                 <span style="font-size: 2rem;font-weight: 700">MESSAGE RECEIVED <i class="fas fa-comment-dots" style="font-size: 2em;padding: 0.5em"></i>  </span>
            
             </div>
</header>
    
    <br>
 
  
    
    <h2 class="text-center p-3 m-3" style="background: #e2e2e2;color:#990000; font-weight: 700">MESSAGE RECEIVED</h2>
    <br><br>
    
    

    
    
    
    
    
    
    
    <table class="table table-bordered">
    
          <tr style="background:#f44336;color: white">
            <th scope="col">Sr. No</th>
            <th scope="col">User Name</th>
            <th scope="col">User Mail</th>
            <th scope="col">Message</th>
            <th scope="col">Message Description</th> 
            <th scope="col">Message Date</th> 
            
          </tr>
       
        
<%
 int sno=0;
 try {
        
         Connection con=ConnectionProvider.getCon();
         Statement st=con.createStatement();
          ResultSet rs=st.executeQuery("select * from messageus");
         while(rs.next())
         {
        
           sno=sno+1;
          
%>
          <tr>
           
             <td><%out.println(sno);%></td> 
            
            <td>             
                <%=rs.getString(1)%> 
            </td>
            
             <td>             
                 <%=rs.getString(2)%> 
            </td>
            
             <td>             
                 <%=rs.getString(3)%> 
            </td>
            
             <td>             
                 <%=rs.getString(4)%> 
            </td>
            
            <%
                        String mDate=rs.getString(5).toString().substring(0, 10);
                       
             %>
            
             <td><%out.println(mDate);%></td>
             
            </tr>
            <%
             }
 } catch (Exception e) {
         System.out.println(e);
     }     
            %>
      
        
      </table>
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    

<br><br><br><br><br><br>


<%@include file="../footer.jsp" %>
</body>
</html>