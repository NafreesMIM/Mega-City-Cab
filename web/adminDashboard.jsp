<%-- 
    Document   : adminDashboard
    Created on : Feb 23, 2025, 11:34:38?AM
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
<html>
<head>
    <title>Admin Dashboard - Mega City Cab</title>
</head>
<body>
    <h2>Admin Dashboard</h2>
    <ul>
         <li><a href="bookingCRUD?action=list">Manage Bookings</a></li>
         <li><a href="vehicleCRUD?action=list">Manage Vehicles</a></li>
         <li><a href="driverCRUD?action=list">Manage Drivers</a></li>
         <li><a href="logout">Logout</a></li>
    </ul>
</body>
</html>

