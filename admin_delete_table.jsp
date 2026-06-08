<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.rcpit.*" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Police Records</title>

<style>
    body {
        font-family: Arial, sans-serif;
        background: linear-gradient(to right, #56ccf2, #2f80ed);
        margin: 0;
        padding: 20px;
    }

    h2 {
        color: #2f80ed;
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
        background-color: #2f80ed;
        color: white;
    }

    tr:nth-child(even) {
        background-color: #f9f9f9;
    }

    a.delete-link {
        color: white;
        background-color: #e53935;
        padding: 6px 12px;
        border-radius: 5px;
        text-decoration: none;
        font-weight: bold;
    }

    a.delete-link:hover {
        background-color: #b71c1c;
    }

    .my-button {
        display: inline-block;
        margin-top: 20px;
        padding: 10px 20px;
        background-color: #2f80ed;
        color: white;
        font-weight: bold;
        border-radius: 8px;
        text-decoration: none;
        transition: background-color 0.3s ease;
    }

    .my-button:hover {
        background-color: #1c5db5;
    }
</style>
</head>
<body>

<%
Connection con = DbConnection.connect();
PreparedStatement pstmt = con.prepareStatement("select * from police");
ResultSet rs = pstmt.executeQuery();
%>

<center>
    <h2>Police Records</h2>
    <table border="">
        <tr>
            <th>Id</th>
            <th>Name</th>
            <th>Station</th>
            <th>Contact</th>
            <th>Email</th>
            <th>Password</th>
            <th>Action</th>
        </tr>

        <% while(rs.next()) { %>
        <tr>
            <td><%= rs.getInt(1) %></td>
            <td><%= rs.getString(2) %></td>
            <td><%= rs.getString(3) %></td>
            <td><%= rs.getString(4) %></td>
            <td><%= rs.getString(5) %></td>
            <td><%= rs.getString(6) %></td>
            <td><a href="admin_delete_use_file.jsp?pid=<%= rs.getInt(1) %>" class="delete-link">Delete</a></td>
        </tr>
        <% } %>
    </table>

    <br><br>
    <a href="manage_police.html" class="my-button">Back to Dashboard</a>
</center>

</body>
</html>
