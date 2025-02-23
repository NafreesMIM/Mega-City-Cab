<%-- 
    Document   : customerDashboard
    Created on : Feb 23, 2025, 11:35:57?AM
    Author     : Moham
--%>

<%@ page import="models.User" %>
<%
    User user = (User) session.getAttribute("user");
    if(user == null || !user.getRole().equalsIgnoreCase("customer")){
         response.sendRedirect("login.jsp");
         return;
    }
%>
<html>
<head>
    <title>Customer Dashboard - Mega City Cab</title>
</head>
<body>
    <h2>Customer Dashboard</h2>
    <ul>
         <li><a href="booking.jsp">Create Booking</a></li>
         <li><a href="booking?userId=<%= user.getId() %>">View Bookings</a></li>
         <li><a href="bill?userId=<%= user.getId() %>">Calculate Bill</a></li>
         <li><a href="help">Help</a></li>
         <li><a href="logout">Logout</a></li>
    </ul>
</body>
</html>

