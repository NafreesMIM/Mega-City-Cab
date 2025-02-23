<%--  
    Document   : adminDashboard
    Created on : Feb 23, 2025, 11:34:38 AM
    Author     : Moham
--%>

<%@ page import="models.User" %>
<%
    User user = (User) session.getAttribute("user");
    if(user == null || !user.getRole().equalsIgnoreCase("admin")){
         response.sendRedirect("login.jsp");
         return;
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard - Mega City Cab</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background: #f4f4f4;
        }
        .header {
            background: #333;
            color: white;
            padding: 15px;
            text-align: center;
            font-size: 24px;
        }
        .container {
            width: 80%;
            margin: 20px auto;
            background: white;
            padding: 20px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
        }
        .nav {
            list-style: none;
            padding: 0;
        }
        .nav li {
            margin: 10px 0;
            padding: 10px;
            background: #007BFF;
            border-radius: 5px;
            text-align: center;
        }
        .nav li a {
            text-decoration: none;
            color: white;
            font-size: 18px;
            display: block;
        }
        .nav li:hover {
            background: #0056b3;
        }
    </style>
</head>
<body>
    <div class="header">Admin Dashboard - Mega City Cab</div>
    <div class="container">
        <h2>Welcome, <%= user.getUsername() %>!</h2>
        <ul class="nav">
            <li><a href="bookingCRUD?action=list">Manage Bookings</a></li>
            <li><a href="vehicleCRUD?action=list">Manage Vehicles</a></li>
            <li><a href="driverCRUD?action=list">Manage Drivers</a></li>
            <li><a href="passwordCRUD?action=list">Manage Passwords</a></li>
            <li><a href="adminCRUD?action=add">Add New Admin</a></li>
            <li><a href="logout">Logout</a></li>
        </ul>
    </div>
</body>
</html>
