<%@page errorPage="error.jsp" %>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/homeAndHeader.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
</head>
    <!--Header-->
    <body>    
       <%
           String email=session.getAttribute("email").toString();
         %>
         <header>
             <div class="header-1">
                 <a href="" class="logo"><i class="fas fa-book-reader"></i>bOOkbEEriEs</a>
                 
                 <form action="searchHome.jsp" method="post" class="search-box-container">
                     <input type="text" placeholder="search here...."  id="search-box" name="search">
                     
                     <button type="submit"><label for="search-box" class="fas fa-search"></label></button>
                </form>
            
             </div>
             
             <div class="header-2">
                 
                 <div id="menu-bar" class="fas fa-bars">                    
                 </div>
                   
                 <nav class="navbar">
                    <a href=""><%out.println(email); %> <i class='fas fa-user-alt'></i></a>
            <a href="home.jsp">HOME</a>
            
            <a href="myOrders.jsp">MY ORDERS</a>
            
            <a href="messageUs.jsp">MESSAGE US</a>
            <a href="about.jsp">ABOUT</a>
            <a href="logout.jsp">LOGOUT</a>
                 </nav>
            
            <div class="icons">
                <abbr title="My Cart"><a href="myCart.jsp"><i class='fas fa-shopping-cart'></i></a></abbr>
                
                
                
                   <!-- <abbr title="My Profile"><a class="dropdown-toggle" href="changeDetails.jsp" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="fa fa-user-circle"></i> </a></abbr>-->
                  
                   
                   
                   
                <div class="dropleft show" style="display: inline">
                   <a class="dropdown-toggle" href="changeDetails.jsp" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="fa fa-user-circle"></i> </a>

                       <div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
                           <a class="dropdown-item" href="changeDetails.jsp">View Profile</a>
                           <a class="dropdown-item" href="changePassword.jsp">Change Password</a>
                           <a class="dropdown-item" href="addChangeAddress.jsp">Add/Change Address</a>
                           <a class="dropdown-item" href="changeSecurityQuestion.jsp">Change Security Question</a>
                           <a class="dropdown-item" href="changeMobileNumber.jsp">Change Mobile Number</a>
                       </div>
                   </div>
                
                
            </div>
                 
             </div>
             
         </header>
    
             
            <script>
                let menu=document.querySelector('#menu-bar');
                let navbar=document.querySelector('.navbar');
                let header= document.querySelector('.header-2');
                
                menu.addEventListener('click', ()=>{
                    menu.classList.toggle('fa-times');
                    navbar.classList.toggle('active');
                });
                
                window.onscroll = () =>{
                    menu.classList.remove('fa-times');
                    navbar.classList.remove('active');
                    
                  
                }
            </script>      
    </body>
</html>
    
    

