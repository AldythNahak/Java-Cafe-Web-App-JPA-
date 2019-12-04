<%-- 
    Document   : update
    Created on : Oct 30, 2019, 2:06:15 PM
    Author     : Aldyth M. V. Nahak (672017081)
--%>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>update-cafeLK</title>
    </head>
    <body>
        <form action="update" method="Post">
            <center>
                <a href="index.jsp"> Home</a>
                <%
                  String id = request.getParameter("id");
                  Class.forName("com.mysql.jdbc.Driver");
                  Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/food","root","");
                  Statement stmt = con.createStatement();
                  
                  ResultSet resultset = stmt.executeQuery("select * from `makanan` where id="+id);
                %>
                <table border="5" style="border-collapse: collapse">
                    <% while (resultset.next()){%> 
                    <tr>
                        <td>Nama</td>
                        <td><input type="text" name="nama" value="<%= resultset.getString(2)%>"/></td>
                    </tr>
                    <tr>
                        <td>Harga</td>
                        <td><input type="text" name="harga" value="<%= resultset.getString(3)%>"/></td>
                    </tr>
                     <tr>
                        <td>Stok</td>
                        <td><input type="text" name="stok" value="<%= resultset.getString(4)%>"/></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td><input  type="submit" value="submit"/></td>
                    </tr>
                    <%}%>
                </table>   
        </form>
    </body>
</html>
