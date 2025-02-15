<%-- 
    Document   : addDriver
    Created on : Feb 4, 2025, 12:23:44?PM
    Author     : Moham
--%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <title>Add Driver - Mega City Cab</title>
    <link rel="stylesheet" type="text/css" href="styles.css">
</head>
<body>
    <div class="form-container">
        <h2>Add New Driver</h2>
        <form action="addDriverServlet" method="post">
            <label for="name">Driver Name:</label>
            <input type="text" id="name" name="name" required>
            <br><br>
            <label for="phone">Phone Number:</label>
            <input type="text" id="phone" name="phone" required>
            <br><br>
            <label for="carAssigned">Car Assigned:</label>
            <input type="text" id="carAssigned" name="carAssigned" required>
            <br><br>
            <button type="submit">Add Driver</button>
        </form>
    </div>
</body>
</html>

