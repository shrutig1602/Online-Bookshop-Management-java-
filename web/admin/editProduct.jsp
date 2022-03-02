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
<title>Update Product</title>
</head>
<body>
    
    <header>
     
             <div class="header-1">              
                 <a href="adminHome.jsp"><i class='fas fa-arrow-circle-left' style="font-size: 2em;color: #990000">Back</i></a>
                 <a href="" class="logo"><i class="fas fa-book-reader"></i>bOOkbEEriEs</a>
                 
                 <span style="font-size: 2rem;font-weight: 700">UPDATE PRODUCT <i class="fas fa-book" style="font-size: 2em;padding: 0.5em"></i>  </span>
            
             </div>
</header>
    
    <br>
 
 
 <%
  String id=request.getParameter("id");
  try {
          Connection con=ConnectionProvider.getCon();
          Statement st=con.createStatement();
          ResultSet rs=st.executeQuery("select * from product where id='"+id+"'");
          while(rs.next())
          {
       
%>



<div class="container-box1">
    <form action="updateProductAction.jsp" method="post" >
        <h1>UPDATE  BOOK</h1>
        <hr style="font-size: 2rem">
        <h3 style="text-align: center;">Product ID: <% out.println(id); %></h3>
      
      <input type="hidden" name="id" value="<% out.println(id); %>">
        
  <div class="form-row">
    <div class="form-group col-md-6">
      <label for="name">Book Name</label>
      <input class="form-control input-box" type="text" name="name" value="<%=rs.getString(2)%>" required>
    </div> 
    <div class="form-group col-md-6">
       <label for="authorName">Author Name</label>
        <input  class="form-control input-box" type="text" name="authorName" value="<%=rs.getString(3)%>" required>
    </div> 
  </div>
    
  <div class="form-group">
    <label for="description">Book Description</label>
     <textarea style="font-size: 1.5rem !important;font-weight: bold" class="form-control "   name="description" rows="8" required ><%=rs.getString(4)%></textarea>
  </div>
    
    
      
    <div class="form-group">
    <label for="category">Book Category</label>
                <input class="form-control input-box"  type="text" name="category" value="<%=rs.getString(6)%>" required>
  </div>
    
  <div class="form-row">
    <div class="form-group col-md-4">
      <label for="price">Book Price</label>
                <input class="form-control input-box"  type="number" name="price" value="<%=rs.getString(7)%>" required>
    </div> 

      <div class="form-group col-md-4">
       <label for="stock">Book Stock</label>
                <input class="form-control input-box"  type="number" name="stock" value="<%=rs.getString(8)%>" required>
    </div> 
      
      
      
  </div>
    
    
        <div class="btn-1">
             <button type="submit" class="btn">UPDATE BOOK</button>
        </div>
 
</form>
</div>  


<%
 }
}
catch(Exception e)
{}
%>

<br><br><br><br><br><br>


<%@include file="../footer.jsp" %>
</body>
</html>