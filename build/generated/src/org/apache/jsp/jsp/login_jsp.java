package org.apache.jsp.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import javax.annotation.Resource;
import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.naming.*;
import java.sql.*;
import javax.sql.*;
import java.io.*;
import java.util.*;
import java.sql.*;
import javax.servlet.http.*;
import javax.servlet.*;

public final class login_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>Home</title>\n");
      out.write("    </head>\n");
      out.write("    <link rel=\"stylesheet\" href=\"../styles/nav.css\"></link>\n");
      out.write("    ");

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
    
      out.write("\n");
      out.write("    <body>        \n");
      out.write("        <div class=\"nav\" style=\"width:100vw; height:10vh; background-color: rgb(50, 52, 56)\">\n");
      out.write("            <img id=\"logo\" src=\"https://www.oneplus.com/content/dam/oasis/page/common/logo/OnePlus_Logo.png\"/>\n");
      out.write("            <div class=\"flex\">\n");
      out.write("                <ul>\n");
      out.write("                    <li>Home</li>\n");
      out.write("                    <li>Community</li>\n");
      out.write("                    <li>Orders</li>\n");
      out.write("                    <li>Cart</li>\n");
      out.write("                    <li id=\"profile\">");
out.print(name);
      out.write("</li>\n");
      out.write("                </ul>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("        <script>\n");
      out.write("\n");
      out.write("            function subt(id) {\n");
      out.write("                console.log(id);\n");
      out.write("                document.getElementById(id).click();\n");
      out.write("            }\n");
      out.write("        </script>\n");
      out.write("    <center>\n");
      out.write("        <h4> Click the image to Buy!</h4>\n");
      out.write("        <img src =\"../styles/kv.jpg\" width=\"634px\" height=\"375px\" usemap=\"#prods\" ismap=\"1\"/>\n");
      out.write("        <map name=\"prods\" id=\"prods\">\n");
      out.write("            <form action =\"list.jsp\" method=\"get\">\n");
      out.write("                <area shape=\"rectangle\" coords=\"28,11,180,197\" title=\"Buy Phone\" onclick=\"subt('phonesub')\" />\n");
      out.write("                <input type=\"submit\" name=\"prod\" value=\"phone\" id=\"phonesub\" hidden/>\n");
      out.write("\n");
      out.write("                <area shape=\"rectangle\" coords=\"226,27,625,208\" title=\"Buy tv\" onclick=\"subt('tvsub')\"/>\n");
      out.write("                <input type=\"submit\" name=\"prod\" value=\"tv\" id=\"tvsub\"  hidden/>\n");
      out.write("\n");
      out.write("                <area shape=\"circle\" coords=\"316,290,80\" title=\"Buy earbuds\"  onclick=\"subt('earsub')\" />\n");
      out.write("                <input type=\"submit\" name=\"prod\" value=\"audio\"  id=\"earsub\" hidden/>\n");
      out.write("            </form>\n");
      out.write("        </map>\n");
      out.write("    </center>\n");
      out.write("</body>\n");
      out.write("</html>\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
