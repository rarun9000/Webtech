<%-- 
    Document   : login
    Created on : 2 Dec, 2021, 12:35:13 PM
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
        <title>Home</title>
    </head>
    <link rel="stylesheet" href="../styles/nav.css"></link>
    <%
        Connection conn;
        Class.forName("org.apache.derby.jdbc.ClientDriver");
        conn = DriverManager.getConnection("jdbc:derby://localhost:1527/website", "rooot", "root");
        Statement st = conn.createStatement();
        String uname = request.getParameter("uname");
        String pass = request.getParameter("pass");
        session.setAttribute("uname", uname);
        session.setAttribute("pass", pass);
        
        uname = (String) session.getAttribute("uname");
        pass = (String) session.getAttribute("pass");

        System.out.println(pass);
        System.out.println(uname);
        
        String q = "select name,mail from data where uname='" + uname + "' and pass='" + pass + "'";
        ResultSet rs = st.executeQuery(q);
        int c = 0;
        String name = "", mail = "";
        if (rs.next()) {
            c++;
            name = rs.getString(1);
            mail = rs.getString(2);
        }
        System.out.println(q);
        if (c == 0) {
            String o = "<script>alert(\"Invalid username or password\"); setTimeout(function(){window.location.href = '../index.html';}, 000); window.stop();</script>";
            out.println(o);
        }
        session.setAttribute("cust", name);
        session.setAttribute("mail", mail);
    %>
    <body>        
        <div class="nav" style="width:100vw; height:10vh; background-color: rgb(50, 52, 56)">
            <img id="logo" src="https://www.oneplus.com/content/dam/oasis/page/common/logo/OnePlus_Logo.png"/>
            <div class="flex">
                <ul>
                    <li>Home</li>
                    <li>Community</li>
                    <li>Orders</li>
                    <li>Cart</li>
                    <li id="profile"><%out.print(name);%></li>
                </ul>
            </div>
        </div>
        <script>

            function subt(id) {
                console.log(id);
                document.getElementById(id).click();
            }
        </script>
    <center>
        <h4> Click the image to Buy!</h4>
        <img src ="../styles/kv.jpg" width="634px" height="375px" usemap="#prods" ismap="1"/>
        <map name="prods" id="prods">
            <form action ="list.jsp" method="get">
                <area shape="rectangle" coords="28,11,180,197" title="Buy Phone" onclick="subt('phonesub')" />
                <input type="submit" name="prod" value="phone" id="phonesub" hidden/>

                <area shape="rectangle" coords="226,27,625,208" title="Buy tv" onclick="subt('tvsub')"/>
                <input type="submit" name="prod" value="tv" id="tvsub"  hidden/>

                <area shape="circle" coords="316,290,80" title="Buy earbuds"  onclick="subt('earsub')" />
                <input type="submit" name="prod" value="audio"  id="earsub" hidden/>
            </form>
        </map>
        <h1>Oneplus 9 Pro. Your new superpower.</h1>
         <video width="80%"  controls>
            <source src="../styles/clip.mp4" type="video/mp4">
        </video>
    </center>
</body>
</html>
