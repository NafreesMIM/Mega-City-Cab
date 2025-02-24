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
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>Admin Dashboard - Mega City Cab</title>
  </head>
  <body>
    <h2>Admin Dashboard</h2>
    <p>Welcome, <%= user.getName() %>!</p>
    <ul>
      <li><a href="vehicleCRUD?action=list">Manage Vehicles</a></li>
      <li><a href="driverCRUD?action=list">Manage Drivers</a></li>
      <li><a href="bookingCRUD?action=list">Manage Bookings</a></li>
      <li><a href="assignDriver">Assign Driver to Booking</a></li>
      <li><a href="adminCRUD?action=add">Add Admin</a></li>
      <li><a href="logout">Logout</a></li>
    </ul>
    <p style="color:green;"><%= request.getParameter("msg") != null ? request.getParameter("msg") : "" %></p>
    <p style="color:red;"><%= request.getParameter("error") != null ? request.getParameter("error") : "" %></p>
  </body>
</html>
