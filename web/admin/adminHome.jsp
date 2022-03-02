<%@page errorPage="../error.jsp" %>
<%@page import="project.ConnectionProvider" %>
<%@page import="java.sql.*" %>
<%@include file="adminHeader.jsp" %>
<%@include file="../footer.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

<!--        <link rel="stylesheet" href="../css/homeAndHeader.css">-->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <script src='https://kit.fontawesome.com/a076d05399.js'></script>
        <title>welcome</title>

    </head>
    <body>
        <%
           response.setHeader("Cache-Control","no-cache, no-store, must-revalidate");
        %>
        
      <%
  String msg=request.getParameter("msg");
  if("done".equals(msg))
  {
    %>
    <div class="alert alert-success alert-dismissible fade show text-center mx-auto" role="alert">
  <strong>Product Status Updated Successfully!</strong>
  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
    <span aria-hidden="true">&times;</span>
  </button>
</div>
      
    <%
  }
 %>   
 
 
 
 <%
  if("alreadyDone".equals(msg))
  {
   %>
   <div class="alert alert-warning alert-dismissible fade show text-center" role="alert">
  <strong>Product is already Active!No need to activate again!!</strong>
  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
    <span aria-hidden="true">&times;</span>
  </button>
</div>

   <%
  }
 %>    
 
 
 
 <%
  if("wrong".equals(msg))
  {
   %>
   <div class="alert alert-danger alert-dismissible fade show text-center" role="alert">
  <strong>Some thing went wrong! Try Again!</strong>
  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
    <span aria-hidden="true">&times;</span>
  </button>
</div>

   <%
  }
 %>    
        
        <div class="row">
            <!-- Show Side Bar -->
        <div class="col-md-3 mt-4 mx-3">
            <div class="list-group">
                <a href="adminHome.jsp" class="list-group-item list-group-item-action active">ALL PRODUCTS </a>
                <a href="addNewProduct.jsp" class="list-group-item list-group-item-action">Add New Product</a>
                <a href="userDetailsAndDeletion.jsp" class="list-group-item list-group-item-action">User Details And Delete User</a>
                <a href="messageReceived.jsp" class="list-group-item list-group-item-action">Messages Received</a>
                <a href="orderReceived.jsp" class="list-group-item list-group-item-action">Orders Received</a>
                <a href="cancelOrders.jsp" class="list-group-item list-group-item-action">Cancelled Orders </a>
                <a href="deliverOrders.jsp" class="list-group-item list-group-item-action">Delivered Orders</a>
                <a href="../logout.jsp" class="list-group-item list-group-item-action">Logout</a>
            </div>
        </div>    





        <div class="col-md-8 mt-4">
            <div class="small_container" style="border: 1px solid #e2e2e2">
                <h2 class="text-center p-3 m-3" style="background: #e2e2e2;color:#black; font-weight: 700">ALL PRODUCTS</h2>
                <div class="row_s">
                    
                      <%
                       try{
            Connection con=ConnectionProvider.getCon();
            Statement st=con.createStatement();
            ResultSet rs=st.executeQuery("select * from product");
           while(rs.next())
           {
                    %>

                    <div class="col_3 product-card text-center p-3 mr-0.5">
                        <img src="../img/books/<%=rs.getString(5)%>"  alt="">
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

                        <h4 class="p-2"><%out.println(name);%></h4>
                        <div style="background: #FAFAFA;border-radius: 12px">
                            <h4 class="p-1">
                             Our Price :
                             <b>&#x20B9;<%=rs.getString(7)%></b> 
                                
                        </h4>
                       
                        <h4 class="p-1">Activation Status :<b><%=rs.getString(9)%></b></h4>
                        <h4 class="p-1">Stock Status :<b><%=rs.getString(8)%> Remaining</b></h4>
                        </div>
                        
                        
                        <a class="btn p-2 btn-outline-success float-left ml-1 px-4" href="activateAction.jsp?id=<%=rs.getString(1)%>">Activate</a>
                        <a class="btn btn-outline-danger float-right mr-1 px-4" href="deActivateAction.jsp?id=<%=rs.getString(1)%>">Deactivate</a>
                        <div class="float-left" style="width:100%"><a class="btn btn-primary px-5 my-1 ml-1 float-left" href="editProduct.jsp?id=<%=rs.getString(1)%>">Edit   <i class="fas fa-edit"></i></a></div>
                        
                        
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

        </div>     

        

<br><br><br><br><br><br><br><br>

    </body>
</html>