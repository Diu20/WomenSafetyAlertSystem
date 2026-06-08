<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.rcpit.*" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>User Details</title>

<style>
    body {
        font-family: Arial, sans-serif;
        background: linear-gradient(to right, #ff758c, #ff7eb3);
        margin: 0;
        padding: 20px;
    }

    h2 {
        color: #e91e63;
        margin-bottom: 20px;
    }

    table {
        border-collapse: collapse;
        width: 90%;
        background-color: white;
        box-shadow: 0 0 10px rgba(0,0,0,0.1);
    }

    th, td {
        padding: 12px 15px;
        border: 1px solid #ddd;
        text-align: center;
    }

    th {
        background-color: #e91e63;
        color: white;
    }

    tr:nth-child(even) {
        background-color: #f9f9f9;
    }

    .my-button {
        display: inline-block;
        margin-top: 20px;
        padding: 10px 20px;
        background-color: #e91e63;
        color: white;
        font-weight: bold;
        border-radius: 8px;
        text-decoration: none;
        transition: background-color 0.3s ease;
    }

    .my-button:hover {
        background-color: #c2185b;
    }
</style>
</head>
<body>

<%
Connection con = DbConnection.connect();
PreparedStatement pstmt = con.prepareStatement("select * from user");
ResultSet rs = pstmt.executeQuery();
%>

<center>
    <h2>User Details</h2>
    <table border="">
        <tr>
            <th>Id</th>
            <th>Name</th>
            <th>Contact</th>
            <th>Address</th>
            <th>Email</th>
            
        </tr>

        <% while(rs.next()) { %>
        <tr>
            <td><%= rs.getInt(1) %></td>
            <td><%= rs.getString(2) %></td>
            <td><%= rs.getString(3) %></td>
            <td><%= rs.getString(4) %></td>
            <td><%= rs.getString(5) %></td>
         
        </tr>
        <% } %>
    </table>

    <br><br>
    <a href="admin_dashboard.html" class="my-button">Back to Dashboard</a>
</center>

</body>
</html>
