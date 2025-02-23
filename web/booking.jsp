<%-- 
    Document   : booking
    Created on : Feb 23, 2025, 11:36:55 AM
    Author     : Moham
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="models.User" %>
<%
    User user = (User) session.getAttribute("user");
    if(user == null){
        response.sendRedirect("login.jsp");
        return;
    }
%>
<html>
<head>
    <title>Create Booking - Mega City Cab</title>
</head>
<body>
    <h2>Create a New Booking</h2>
    <form action="booking" method="post">
        Destination: <input type="text" name="destination" required /><br/>
        Base Fare: <input type="number" name="baseFare" step="0.01" required /><br/>
        <input type="submit" value="Book Now" />
    </form>
    <div style="color:red;">
        ${error}
    </div>
    <br/>
    <a href="customerDashboard.jsp">Back to Dashboard</a>
</body>
</html>

