<%@page import="project.ConnectionProvider" %>
<%@page import="java.sql.*" %>
<%
  try {
         Connection con=ConnectionProvider.getCon();
         Statement st=con.createStatement();
         String q1="create table users(name varchar(100),email varchar(100)primary key,gender varchar(50),securityQuestion varchar(200),answer varchar(200),mobileNumber bigint,password varchar(100),address varchar(500),city varchar(100),state varchar(100),country varchar(100))";
         String q2="create table product(id int primary key,name varchar(500),authorName varchar(500),description varchar(7000),photo varchar(200),category varchar(200),price bigint,stock bigint,active varchar(10));";
         String q3="create table cart(email varchar(100),product_id int,quantity int,price int,total int,address varchar(500),city varchar(100),state varchar(100),country varchar(100),mobileNumber bigint,orderDate varchar(100),deliveryDate varchar(100),status varchar(10))";
         String q4="create table shippingInfo(email varchar(100),name varchar(200),mobileNumber bigint,address varchar(500),city varchar(100),state varchar(100),country varchar(100))";
         String q5="create table messageUs(name varchar(100),email varchar(100),mSubject varchar(500),mDesc varchar(7000),mDate varchar(100))";
         System.out.println(q5);
         //st.execute(q1);
         st.execute(q5);
         System.out.println("Table created");
         con.close();
      } catch (Exception e) {
          System.out.println(e);
      }


%>