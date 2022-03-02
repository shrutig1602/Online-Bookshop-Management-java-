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
        <title>Home</title>
    </head>
    <body>
        
        
        <%
           response.setHeader("Cache-Control","no-cache, no-store, must-revalidate");
        %>
        
<!--        <img src="img/header.png" width="100%" height="400px">-->
        
        
        <br>
        
        <h2 class="text-center p-3 m-3" style="background: #e2e2e2;color:#black; font-weight: 700">OUR ALL PRODUCTS</h2>

        <%
            String msg = request.getParameter("msg");
            if ("added".equals(msg)) {
        %>
       <div class="alert alert-warning alert-dismissible fade show text-center" role="alert">
  <strong>Congratulations!</strong> Product added successfully!
  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
    <span aria-hidden="true">&times;</span>
  </button>
</div>
       
        <%
            }
        %>


        <%
            if ("exist".equals(msg)) {
        %>
        <div class="alert alert-success alert-dismissible fade show text-center" role="alert">
  <strong>Hey There!</strong> Product already exist in you cart! Quantity  increased!
  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
    <span aria-hidden="true">&times;</span>
  </button>
</div>
        
        <%
            }
        %>

        <%
            if ("invalid".equals(msg)) {
        %>
        <div class="alert alert-danger alert-dismissible fade show text-center" role="alert">
  <strong>Oops Sorry!</strong> Something Went Wrong !! Try Again
  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
    <span aria-hidden="true">&times;</span>
  </button>
</div>
        
        <%
            }
        %>

        <div class="col-md-12">
            <div class="small_container">
                <div class="row_s">
                    <%
                       try{
            Connection con=ConnectionProvider.getCon();
            Statement st=con.createStatement();
            ResultSet rs=st.executeQuery("select * from product where active='YES'");
           while(rs.next())
           {
                    %>




                    <div class="col_3 product-card text-center p-3 mr-0.5">
                        <img src="img/books/<%=rs.getString(5)%>"  alt="">


                       <%
                           String name=rs.getString(2);
                           String res="";
                          String [] strs=name.split(" ");
                          if(strs.length>4)
                          {
                            
                            for(int i=0;i<4;i++)
                            {
                              res=res+strs[i]+" ";
                            }
                            name=res+"..."; 
                          }
                         %>
                         <h4 class="p-2"><b><%=rs.getString(6)%></b></h4>
                        <h4 class="p-2"><%out.println(name);%></h4>
                        <br><br>
                        <div style="background: #FAFAFA;border-radius: 12px">
                            <h4 class="p-2">
                             Our Price :
                             <b>&#x20B9;<%=rs.getString(7)%></b> 
                                
                        </h4>
                       
                        
                        </div>
                        
                        
                        
                             <a class="btn float-left btn-outline-success" style="border-color: #28a745  !important;" href="showMore.jsp?id=<%=rs.getString(1)%>">Show more</a>
                        <a class="btn  float-right btn-warning px-4  " href="addToCartAction.jsp?id=<%=rs.getString(1)%>">Add To Cart <i class="fas fa-shopping-cart"></i></a>
                        



                    </div>		
                    <%
   }
}
catch(Exception e){
  System.out.println(e);
}

                       
                    %>

                </div>
            </div>
        </div>

                    


    
                    
                    
                    
                    
                    
                <br>
                <br><br><br><br><br><br><br><br><br>
<%@include file="footer.jsp" %>
    </body>
</html>