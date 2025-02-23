<%-- 
    Document   : bookingDetails
    Created on : Feb 23, 2025, 11:37:40 AM
    Author     : Moham
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="models.Booking" %>
<html>
<head>
    <title>Booking Details - Mega City Cab</title>
</head>
<body>
    <h2>Your Bookings</h2>
    <%
        List<Booking> bookings = (List<Booking>) request.getAttribute("bookings");
        if(bookings != null && !bookings.isEmpty()){
    %>
    <table border="1">
        <tr>
            <th>Booking ID</th>
            <th>Destination</th>
            <th>Date</th>
            <th>Base Fare</th>
        </tr>
        <%
            for(Booking b : bookings){
        %>
        <tr>
            <td><%= b.getBookingId() %></td>
            <td><%= b.getDestination() %></td>
            <td><%= b.getBookingDate() %></td>
            <td><%= b.getBaseFare() %></td>
        </tr>
        <%
            }
        %>
    </table>
    <% } else { %>
        <p>No bookings found.</p>
    <% } %>
    <br/>
    <a href="customerDashboard.jsp">Back to Dashboard</a>
</body>
</html>

