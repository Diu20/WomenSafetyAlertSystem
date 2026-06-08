<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.rcpit.*" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Respond to Alerts - Police</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(to right, #43cea2, #185a9d);
            padding: 30px;
            margin: 0;
            color: #333;
        }

        h2 {
            text-align: center;
            color: #fff;
            margin-bottom: 30px;
        }

        table {
            border-collapse: collapse;
            width: 90%;
            margin: auto;
            background-color: #fff;
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.2);
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

        .action-buttons form {
            display: flex;
            justify-content: center;
            gap: 10px;
        }

        .action-buttons button {
            padding: 8px 15px;
            border: none;
            border-radius: 5px;
            font-weight: bold;
            color: white;
            cursor: pointer;
        }

        .approve-btn {
            background-color: #28a745;
        }

        .reject-btn {
            background-color: #dc3545;
        }

        .my-button {
            display: inline-block;
            margin: 25px auto 0;
            padding: 12px 25px;
            background-color: #e91e63;
            color: white;
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

<h2> Respond to User Alerts</h2>

<%
Connection con = DbConnection.connect();
PreparedStatement pstmt = con.prepareStatement("SELECT * FROM alerts WHERE astatus='Pending'");
ResultSet rs = pstmt.executeQuery();
%>

<table>
    <tr>
        <th>Alert ID</th>
        <th>User ID</th>
        <th>Location</th>
        <th>Type</th>
        <th>Description</th>
        <th>Date</th>
        <th>Status</th>
        <th>Action</th>
    </tr>

    <%
    while(rs.next()) {
        int aid = rs.getInt("aid");
    %>
    <tr>
        <td><%= aid %></td>
        <td><%= rs.getInt("uid") %></td>
        <td><%= rs.getString("alocation") %></td>
        <td><%= rs.getString("aalerttype") %></td>
        <td><%= rs.getString("adesc") %></td>
        <td><%= rs.getString("adate") %></td>
        <td><%= rs.getString("astatus") %></td>
        <td class="action-buttons">
            <form action="RespondToAlertServlet" method="post">
                <input type="hidden" name="alertId" value="<%= aid %>">
                <input type="hidden" name="status" value="Approved">
                <button class="approve-btn" type="submit">Approve</button>
            </form>
            <form action="RespondToAlertServlet" method="post">
                <input type="hidden" name="alertId" value="<%= aid %>">
                <input type="hidden" name="status" value="Rejected">
                <button class="reject-btn" type="submit">Reject</button>
            </form>
        </td>
    </tr>
    <% } %>
</table>

<div class="center">
    <a href="police_dashboard.html" class="my-button"> Back to Dashboard</a>
</div>

</body>
</html>
