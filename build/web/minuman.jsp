<%-- 
    Document   : minuman
    Created on : Nov 6, 2019, 1:53:56 PM
    Author     : Aldyth M. V. Nahak (672017081)
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <center><h1>Input Minuman</h1></center>
               <form action="insertminuman" method="Post">
            <center>
                <table border="5" style="border-collapse: collapse;">
                    <tr><td>Nama Minuman</td><td><input type="text" name="nama"/></td></tr>
                    <tr><td>Harga</td><td><input type="text" name="harga"/></td></tr>
                    <tr><td></td><td><input type="submit" value="submit"/></td></tr>
                </table>
            </center>
        </form>
        
        
        <center>
            <h3>Data Minuman</h3>
        <br>
        <%
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/food","root","");
        Statement stmt = con.createStatement();
        ResultSet resultset = stmt.executeQuery("select * from `minuman`");
        %>
        
        <table border="2">
            <tr>
            <th>id</th>
            <th>Nama Minuman</th>
            <th>Harga</th>
            <th>Stok</th>
            <th colspan="2">Action</th>
            </tr>
            <% while(resultset.next()){%>
            <tr>
                <td><%= resultset.getInt(1)%></td>
                <td><%= resultset.getString(2)%></td>
                <td><%= resultset.getString(3)%></td>
                <td><%= resultset.getString(4)%></td>
                <td><a href="updatemnm.jsp?id=<%= resultset.getString(1)%>">Update</a></td>
                <td><a href="delete?id=<%= resultset.getString(1)%>">Delete</a></td>
            </tr>
            <%}%>
        </table>
        <a href="index.jsp"> Home</a>
    </center>
    </body>
</html>
