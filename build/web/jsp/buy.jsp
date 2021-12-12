<%-- 
    Document   : buy
    Created on : Dec 2, 2021, 12:06:17 AM
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
        <title>JSP Page</title>
    </head>
    <body>
        <%
          //  out.println(request.getParameter("prod_id"));
           // out.println("<br>Customer Name: "+session.getAttribute("cust"));
            Connection conn;
            Class.forName("org.apache.derby.jdbc.ClientDriver");
            conn=DriverManager.getConnection("jdbc:derby://localhost:1527/website","rooot","root");
            Statement st=conn.createStatement();
            String q="select * from items where id='"+request.getParameter("prod_id")+"'";
            session.setAttribute("prod",request.getParameter("prod_id"));
            ResultSet rs = st.executeQuery(q);
            String name="",price="",color="",desc="",link="";
            if(rs.next()){
                name = rs.getString(3);
                desc = rs.getString(5);
                color = rs.getString(6);
                link = rs.getString(7);
                price = rs.getString(8);
            }  
        %>
    <center>
        <h1>Confirmation</h1>
        <form action="confirm.jsp" method="get">
        <table width="75%">
            <tr>                
                <td  align="center" colspan="2"><img src= "<% out.print(link); %>" height=40% width=30% /></td>
            </tr>
            <tr>
                <td align="right">Product</td>
                <td align="center"><% out.print(name); %></td>
            </tr>
            <tr>
                <td align="right">Price</td>
                <td align="center"><% out.print("₹ "+price); %></td>
            </tr>
            <tr>
                <td align="right">Description</td>
                <td align="center"><% out.print(desc); %></td>
            </tr>
            <tr>                
                <td  align="center" colspan="2"><input type="submit" values="Confirm Purchase"/></td>
            </tr>
        </table>
            </form>
    </center>
    </body>
</html>
