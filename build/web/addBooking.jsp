<%-- 
    Document   : addBooking
    Created on : Feb 4, 2025, 12:23:04?PM
    Author     : Moham
--%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <title>Add Booking - Mega City Cab</title>
    <link rel="stylesheet" type="text/css" href="styles.css">
</head>
<body>
    <div class="form-container">
        <h2>Create New Booking</h2>
        <form action="addBookingServlet" method="post">
            <label for="customerId">Customer ID:</label>
            <input type="text" id="customerId" name="customerId" required>
            <br><br>
            <label for="destination">Destination:</label>
            <input type="text" id="destination" name="destination" required>
            <br><br>
            <label for="date">Date:</label>
            <input type="date" id="date" name="date" required>
            <br><br>
            <label for="time">Time:</label>
            <input type="time" id="time" name="time" required>
            <br><br>
            <button type="submit">Create Booking</button>
        </form>
    </div>
</body>
</html>

