<%-- 
    Document   : newjsp
    Created on : 1 Dec, 2021, 8:35:39 PM
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
        <title>Products</title>
    </head>
    <body>
        <div class="container">
     <%
               System.out.println("List page"+session.getAttribute("cust"));
               Connection conn;
               Class.forName("org.apache.derby.jdbc.ClientDriver");
               conn=DriverManager.getConnection("jdbc:derby://localhost:1527/website","rooot","root");
               Statement st=conn.createStatement();
               
               String type=(String) request.getParameter("prod");
            
               String q ="select * from items where type='"+type+"'";
               ResultSet rs =st.executeQuery(q);
               int i = 0;
               int cc = 3;
               while(rs.next()){
                   i++;
                   if(i%cc==1){
                       out.println("<div class=\"row\" style=\"dispaly: flexbox; justify-content:space-evenly\" >");
                   }
                   
                   String id = rs.getString(1);
                   out.println("<div id="+id+" class=\"prod\" style=\"display: inline-block; ;width: "+(100/cc)+"%; align-items: center; box-shadow: 0 0 10px black; \" >");
                   out.println("<form action=\"buy.jsp\" method=\"get\" >");
                   String name = rs.getString(3);
                   String qty = rs.getString(4);
                   String desc =rs.getString(5);
                   String col = rs.getString(6);
                   String src = rs.getString(7);   
                   String price= rs.getString(8);
                   String img = "<img src ='" + src+"' height=30% width =100% />";
                   String tit ="<h3 align=center style=\"display: block;\">"+name+"&nbsp- &nbsp ₹"+price+"</h3>";
                   String desc1 = "<h5 align=center style=\"display: block;\" >"+desc+"</h5>";
                   String colour = " <div  style=\"background-color: "+col+";height: 40px; width: 40px; border-radius: 20px;display: flex; margin-left: 14vw;\"></div>";
                   String but="<button  style=\"display: inline-block;height: 20px; width: 10%px; border-radius: 20px;margin-left:12vw; background-color: green;\" type=submit value=\""+id+"\" name='prod_id'>Buy Now!</button>";
                   out.println(img);
                   out.println(tit);
                   //out.println(desc1);
                   out.println(colour);
                    out.println(but);
                    out.println("<form>");
                   out.println("</div>");  
                   
                   if(i%cc==0){
                       out.println("</div><br><br><br><br>");
                   }
              }               
    %>
    </div>
    </body>
</html>
