<%@page errorPage="error.jsp" %>
<%@page import="project.ConnectionProvider" %>
<%@page import="java.sql.*" %>
<%
  String email=session.getAttribute("email").toString();
  String name=request.getParameter("name");
  String address=request.getParameter("address");
  String city=request.getParameter("city");
  String state=request.getParameter("state");
  String country=request.getParameter("country");
  String mobileNumber =request.getParameter("mobileNumber");
  String status="bill";
  int z=0;
  
try {
        Connection con=ConnectionProvider.getCon();
        Statement st=con.createStatement();
       PreparedStatement ps3=con.prepareStatement("update shippingInfo set name=?,mobileNumber=?,address=?,city=?,state=?,country=? where email=?");
          
           ps3.setString(1, name);
            ps3.setString(2, mobileNumber);
           ps3.setString(3, address);
            ps3.setString(4, city);
             ps3.setString(5, state);
             ps3.setString(6, country);
             ps3.setString(7, email);
             ps3.executeUpdate();
        
        
        ResultSet rs=st.executeQuery("select * from users where email='"+email+"' and address=''");
        while(rs.next())
        {
          PreparedStatement ps2=con.prepareStatement("update users set address=?,city=?,state=?,country=? where email=?");
        ps2.setString(1, address);
        ps2.setString(2, city);
        ps2.setString(3, state);
        ps2.setString(4, country);
        ps2.setString(5, email);
        ps2.executeUpdate();
        }
        
         
          
      
        
        PreparedStatement ps1=con.prepareStatement("update cart set address=?,city=?,state=?,country=?,mobileNumber=?,orderDate=now(),deliveryDate=DATE_ADD(orderDate,INTERVAL 7 DAY),status=? where email=? and address is NULL");
        ps1.setString(1, address);
        ps1.setString(2, city);
        ps1.setString(3, state);
        ps1.setString(4, country);
        ps1.setString(5, mobileNumber);
        ps1.setString(6, status);
        ps1.setString(7, email);
        ps1.executeUpdate();
        
        
        
        
        
        
        
        
        
        
        
        
        response.sendRedirect("bill.jsp");
        
    } catch (Exception e) {
        System.out.println(e);
    }
%>