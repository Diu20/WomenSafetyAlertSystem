<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.rcpit.*" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>View Alerts</title>

<style>
    body {
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        background: linear-gradient(to right, #74ebd5, #9face6);
        margin: 0;
        padding: 20px;
    }

    h2 {
        text-align: center;
        color: #333;
        margin-bottom: 20px;
    }

    table {
        border-collapse: collapse;
        width: 90%;
        margin: auto;
        background-color: white;
        border-radius: 10px;
        overflow: hidden;
        box-shadow: 0 0 20px rgba(0,0,0,0.1);
    }

    th, td {
        padding: 12px 16px;
        text-align: center;
        border-bottom: 1px solid #ddd;
    }

    th {
        background-color: #2f80ed;
        color: white;
    }

    tr:hover {
        background-color: #f1f1f1;
    }

    .badge {
        padding: 5px 10px;
        border-radius: 20px;
        font-size: 14px;
        color: white;
        font-weight: bold;
    }

    .pending {
        background-color: orange;
    }

    .approved {
        background-color: green;
    }

    .rejected {
        background-color: red;
    }

    .my-button {
        display: inline-block;
        margin-top: 20px;
        padding: 12px 25px;
        background-color: #e91e63;
        color: white;
        border: none;
        border-radius: 8px;
        text-decoration: none;
        font-size: 16px;
        font-weight: bold;
        transition: background-color 0.3s ease;
    }

    .my-button:hover {
        background-color: #c2185b;
    }

    .center {
        text-align: center;
    }
</style>
</head>
<body>

<center>
<h2>All Safety Alerts</h2>

<%
Connection con = DbConnection.connect();
PreparedStatement pstmt = con.prepareStatement("SELECT * FROM alerts");
ResultSet rs = pstmt.executeQuery();
%>

<table>
    <tr>
        <th>Id</th>
        <th>Uid</th>
        <th>Location</th>
        <th>Alert Type</th>
        <th>Description</th>
        <th>Date</th>
        <th>Status</th>
    </tr>

    <% while(rs.next()) { 
        String status = rs.getString(7);
        String statusClass = "";
        if(status.equalsIgnoreCase("Pending")) statusClass = "pending";
        else if(status.equalsIgnoreCase("Approved")) statusClass = "approved";
        else if(status.equalsIgnoreCase("Rejected")) statusClass = "rejected";
    %>
    <tr>
        <td><%= rs.getInt(1) %></td>
        <td><%= rs.getInt(2) %></td>
        <td><%= rs.getString(3) %></td>
        <td><%= rs.getString(4) %></td>
        <td><%= rs.getString(5) %></td>
        <td><%= rs.getString(6) %></td>
        <td><span class="badge <%= statusClass %>"><%= status %></span></td>
        <td><a href="<%= rs.getString("alocation") %>" target="_blank">📍 View Location</a></td>
        
    </tr>
    <% } %>
</table>

<div class="center">
    <a href="police_dashboard.html" class="my-button"> Back to Dashboard</a>
</div>

</center>

</body>
</html>
