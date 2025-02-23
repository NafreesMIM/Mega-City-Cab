<%-- 
    Document   : manageBookings
    Created on : Feb 23, 2025, 11:39:48 AM
    Author     : Moham
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="models.Booking"%>
<html>
<head>
    <title>Manage Bookings - Admin</title>
</head>
<body>
    <h2>Manage Bookings</h2>
    <!-- Form to add new booking -->
    <form action="bookingCRUD" method="post">
        <input type="hidden" name="action" value="add" />
        User ID: <input type="number" name="userId" required /><br/>
        Destination: <input type="text" name="destination" required /><br/>
        Base Fare: <input type="number" step="0.01" name="baseFare" required /><br/>
        <input type="submit" value="Add Booking" />
    </form>
    <hr/>
    <table border="1">
        <tr>
            <th>Booking ID</th>
            <th>User ID</th>
            <th>Destination</th>
            <th>Booking Date</th>
            <th>Base Fare</th>
            <th>Actions</th>
        </tr>
        <%
            List<Booking> bookings = (List<Booking>) request.getAttribute("bookings");
            if(bookings != null) {
                for(Booking b : bookings) {
        %>
        <tr>
            <td><%= b.getBookingId() %></td>
            <td><%= b.getUserId() %></td>
            <td><%= b.getDestination() %></td>
            <td><%= b.getBookingDate() %></td>
            <td><%= b.getBaseFare() %></td>
            <td>
                <a href="bookingCRUD?action=edit&bookingId=<%= b.getBookingId() %>">Edit</a> |
                <a href="bookingCRUD?action=delete&bookingId=<%= b.getBookingId() %>" onclick="return confirm('Are you sure?');">Delete</a>
            </td>
        </tr>
        <%
                }
            }
        %>
    </table>
    <br/>
    <a href="adminDashboard.jsp">Back to Dashboard</a>
</body>
</html>

