<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.rcpit.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>View Police Responses</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(to right, #FFDEE9, #B5FFFC);
            margin: 0;
            padding: 30px;
        }

        h2 {
            text-align: center;
            color: #333;
            margin-bottom: 25px;
        }

        table {
            width: 90%;
            margin: auto;
            border-collapse: collapse;
            background-color: white;
            border-radius: 10px;
            box-shadow: 0 0 20px rgba(0,0,0,0.1);
        }

        th, td {
            padding: 12px 16px;
            text-align: center;
            border-bottom: 1px solid #ddd;
        }

        th {
            background-color: #0077b6;
            color: white;
        }

        tr:hover {
            background-color: #f0f0f0;
        }

        .badge {
            padding: 5px 12px;
            border-radius: 20px;
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
            margin: 25px auto;
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

<%
    int uid = GetSet.getUid(); 
    Connection con = DbConnection.connect();
    PreparedStatement pstmt = con.prepareStatement("SELECT * FROM alerts WHERE uid=?");
    pstmt.setInt(1, uid);
    ResultSet rs = pstmt.executeQuery();
%>

<h2>View Police Responses to Your Alerts</h2>

<table>
    <tr>
        <th>Alert ID</th>
        <th>Location</th>
        <th>Alert Type</th>
        <th>Description</th>
        <th>Date</th>
        <th>Status</th>
    </tr>

    <% while(rs.next()) { 
        String status = rs.getString("astatus");
        String cssClass = "";
        if ("Pending".equalsIgnoreCase(status)) cssClass = "pending";
        else if ("Approved".equalsIgnoreCase(status)) cssClass = "approved";
        else if ("Rejected".equalsIgnoreCase(status)) cssClass = "rejected";
    %>
    <tr>
        <td><%= rs.getInt("aid") %></td>
        <td><%= rs.getString("alocation") %></td>
        <td><%= rs.getString("aalerttype") %></td>
        <td><%= rs.getString("adesc") %></td>
        <td><%= rs.getString("adate") %></td>
        <td><span class="badge <%= cssClass %>"><%= status %></span></td>
    </tr>
    <% } %>
</table>

<div class="center">
    <a href="user_dashboard.html" class="my-button">Back to Dashboard</a>
</div>

</body>
</html>
