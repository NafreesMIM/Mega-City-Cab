<%-- 
    Document   : editBooking
    Created on : Feb 23, 2025, 11:40:38 AM
    Author     : Moham
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="models.Booking" %>
<html>
<head>
    <title>Edit Booking - Admin</title>
</head>
<body>
    <h2>Edit Booking</h2>
    <%
        Booking booking = (Booking) request.getAttribute("booking");
        if(booking == null) {
    %>
        <p>Booking not found.</p>
    <%
        } else {
    %>
    <form action="bookingCRUD" method="post">
        <input type="hidden" name="action" value="update" />
        <input type="hidden" name="bookingId" value="<%= booking.getBookingId() %>" />
        Destination: <input type="text" name="destination" value="<%= booking.getDestination() %>" required /><br/>
        Base Fare: <input type="number" step="0.01" name="baseFare" value="<%= booking.getBaseFare() %>" required /><br/>
        <input type="submit" value="Update Booking" />
    </form>
    <%
        }
    %>
    <br/>
    <a href="bookingCRUD?action=list">Back to Manage Bookings</a>
</body>
</html>

