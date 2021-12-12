<%-- 
    Document   : confirm
    Created on : Dec 2, 2021, 9:22:18 PM
    Author     : rarun
--%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page import="javax.annotation.Resource" %>
<%@ page import="java.time.LocalTime" %>
 <%@ page import="javax.sql.DataSource" %>
 <%@ page import="java.util.Date" %>
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
        <title>JSP Page</title>
    </head>
    <body>
    <%
         Connection conn;
               Class.forName("org.apache.derby.jdbc.ClientDriver");
               conn=DriverManager.getConnection("jdbc:derby://localhost:1527/website","rooot","root");
               Statement st=conn.createStatement();
               System.out.println("Name: "+ session.getAttribute("cust"));
               String name = (String)session.getAttribute("cust");
               String email = (String)session.getAttribute("mail");
               String prod =(String) session.getAttribute("prod");
               int r =0;
               String q = null,rf=null;
               if(name !=null && prod!=null){
                    Date date = new Date();
                     SimpleDateFormat ft =     new SimpleDateFormat ("yyyy-MM-dd");
                     SimpleDateFormat ftt =     new SimpleDateFormat ("MM.dd.hh.mm.ss.");
                        rf = ftt.format(date) + name;

                    String d= ft.format(date);
                    q = "insert into orders values('"+rf+"','"+prod+"','"+d+"','"+name+"','"+email+"')";
                    System.out.println(q);
                     r = st.executeUpdate(q);
               }
               String stat ="no";
               if(r == 0){
                   q = "<script> alert(\"Order placement failed! Try Again.\");</script>";
               }
               else{
                   q = "<script> alert(\"Order Successfully placed! Your ID: "+rf+"\");</script>";
                   stat = rf;
               }
               
               out.print(q);               
    %>
    <form name="form1" action="login.jsp" method="post">
        <input type="text" name="uname" value="<%out.print(session.getAttribute("uname"));%>" hidden/>
        <input type="pass" name="pass" value="<%out.print(session.getAttribute("pass"));%>" hidden/>
    </form>
    <%
        String scr = "<script> document.form1.submit();</script>";
        out.println(scr);
    %>
    </body>
</html>
