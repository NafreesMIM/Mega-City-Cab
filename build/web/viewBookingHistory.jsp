<%-- 
    Document   : viewBookingHistory
    Created on : Feb 5, 2025, 6:26:27 AM
    Author     : Moham
--%>

<%@ page import="java.util.List" %>
<%@ page import="com.megacitycab.model.Booking" %>
<%@ page import="com.megacitycab.dao.BookingDAO" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Booking History</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <h2>Your Booking History</h2>
    
    <%
        HttpSession userSession = request.getSession(false);
        if (userSession == null || userSession.getAttribute("userId") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        String customerId = (String) userSession.getAttribute("userId");
        List<Booking> bookingList = BookingDAO.getBookingsByCustomerId(customerId);
    %>

    <table border="1">
        <tr>
            <th>Booking ID</th>
            <th>Pickup Location</th>
            <th>Destination</th>
            <th>Car ID</th>
            <th>Driver Name</th>
            <th>Status</th>
            <th>Booking Date</th>
        </tr>
        
        <% for (Booking booking : bookingList) { %>
        <tr>
            <td><%= booking.getBookingId() %></td>
            <td><%= booking.getPickupLocation() %></td>
            <td><%= booking.getDestination() %></td>
            <td><%= booking.getCarId() %></td>
            <td><%= booking.getDriverName() %></td>
            <td><%= booking.getStatus() %></td>
            <td><%= booking.getBookingDate() %></td>
        </tr>
        <% } %>
    </table>

    <br>
    <a href="customerDashboard.jsp">Back to Dashboard</a>
</body>
</html>

