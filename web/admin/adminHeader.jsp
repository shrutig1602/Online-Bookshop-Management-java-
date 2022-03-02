<%@page errorPage="../error.jsp" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="../css/homeAndHeader.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
</head>

<body>    
       <%
           String email=session.getAttribute("email").toString();
         %>
         <header>
             <div class="header-1">
                 <a href="" class="logo"><i class="fas fa-book-reader"></i>bOOkbEEriEs</a>
                 
                 <form action="searchAdminHome.jsp" method="post" class="search-box-container">
                     <input type="text" placeholder="search here...."  id="search-box" name="search">
                    <button type="submit"><label for="search-box" class="fas fa-search"></label></button>
                </form>
            
             </div>
             
             </header>
    
             
            
    </body>
</html>
           
