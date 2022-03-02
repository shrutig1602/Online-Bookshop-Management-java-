<%@page import="project.ConnectionProvider" %>
<%@page import="java.sql.*" %>

<%
  String name=request.getParameter("name");
  String email=request.getParameter("email");
  String gender=request.getParameter("gender");
  
  String securityQuestion=request.getParameter("securityQuestion");
  String answer=request.getParameter("answer");
  String mobileNumber=request.getParameter("mobilenumber");
  String password=request.getParameter("password");
  String address="";
  String city="";
  String state="";
  String country="";
  try {
          Connection con=ConnectionProvider.getCon();
          
          PreparedStatement ps=con.prepareStatement("insert into users values(?,?,?,?,?,?,?,?,?,?,?)");
          ps.setString(1, name);
          ps.setString(2, email);
          ps.setString(3, gender);    
          
          ps.setString(4, securityQuestion);
          ps.setString(5, answer);  
          ps.setString(6, mobileNumber);
          ps.setString(7, password);
          ps.setString(8, address);
          ps.setString(9, city);
          ps.setString(10, state);
          ps.setString(11, country);
          ps.executeUpdate();
          
          
          
          
          
        PreparedStatement ps3=con.prepareStatement("insert into shippingInfo values(?,?,?,?,?,?,?)");
          ps3.setString(1, email);
           ps3.setString(2, name);
            ps3.setString(3, mobileNumber);
           ps3.setString(4, address);
            ps3.setString(5, city);
             ps3.setString(6, state);
             ps3.setString(7, country);
             ps3.executeUpdate();
        
          
          
          
          
          response.sendRedirect("register.jsp?msg=valid");
      } catch (Exception e) {
          System.out.println(e);
          response.sendRedirect("register.jsp?msg=invalid");     
      }
%>