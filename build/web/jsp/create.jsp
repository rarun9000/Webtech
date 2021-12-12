<%-- 
    Document   : create
    Created on : 2 Dec, 2021, 12:26:16 PM
    Author     : rarun
--%>
<%@ page import="javax.annotation.Resource" %>
 <%@ page import="javax.sql.DataSource" %>
 <%@ page import="java.sql.Connection" %>
 <%@ page import="java.sql.DriverManager" %>
 <%@ page import="java.sql.PreparedStatement" %>
 <%@ page import="java.sql.ResultSet" %>
 <%@ page import="javax.servlet.*" %>
 <%@ page import="javax.servlet.http.*" %>
 <%@ page import="javax.naming.*,java.sql.*,javax.sql.*" %>
 <%@ page import="java.io.*,java.util.*,java.sql.*" %>
 <%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
        
     <% 
            int c = 0;
            String  q= "";
         try{
               Connection conn;
               Class.forName("org.apache.derby.jdbc.ClientDriver");
               conn=DriverManager.getConnection("jdbc:derby://localhost:1527/website","rooot","root");
               Statement st=conn.createStatement();
               String name = request.getParameter("fname");
               String uname = request.getParameter("uname");
               String mail = request.getParameter("email");
               String pass= request.getParameter("pass");
               int sex = request.getParameter("sex").equals("Male")?1:0;
               
               q = "insert into data values('"+name+"','"+uname+"','"+pass+"','"+mail+"',"+sex+")";
               System.out.println(q);
               c = st.executeUpdate(q);       
            }
            catch(Exception e){
                System.out.println("Error: "+e);
            }
    %>
    <body>
        <%  
            if(c == 0){
               q = "<script>alert(\" Something went wrong! Please try again with different username.\")</script>"; 
            }
            else{
               q = "<script>alert(\" Registration Succesful! You will be redirected to signin page :) .\")</script>";  
            }
            out.println(q);
            out.println("<script> setTimeout(function(){window.location.href = '../index.html';}, 3000); </script>");
        %>            
    </body>
</html>
