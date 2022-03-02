<%@page import="project.ConnectionProvider" %>
<%@page import="java.sql.*" %>

<%
  String email=session.getAttribute("email").toString();
  String mSubject=request.getParameter("mSubject");
  String mDesc=request.getParameter("mDesc");
  String name="";
  try {
        Connection con=ConnectionProvider.getCon();
        Statement st=con.createStatement();
        ResultSet rs=st.executeQuery("select * from users where email='"+email+"'" );    
        while(rs.next())
        {
          name=rs.getString(1);
        }
        
        PreparedStatement ps=con.prepareStatement("insert into messageus (name,email,mSubject,mDesc,mDate) values(?,?,?,?,now())");
        ps.setString(1,name);
        ps.setString(2,email);
        ps.setString(3,mSubject);
        ps.setString(4,mDesc);
        ps.executeUpdate();
        response.sendRedirect("messageUs.jsp?msg=sent");
  }
  catch(Exception e)
  {
  
  }
  %>