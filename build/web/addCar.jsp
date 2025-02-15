<%-- 
    Document   : addCar
    Created on : Feb 4, 2025, 12:24:12?PM
    Author     : Moham
--%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <title>Add Car - Mega City Cab</title>
    <link rel="stylesheet" type="text/css" href="styles.css">
</head>
<body>
    <div class="form-container">
        <h2>Add New Car</h2>
        <form action="addCarServlet" method="post">
            <label for="model">Car Model:</label>
            <input type="text" id="model" name="model" required>
            <br><br>
            <label for="licensePlate">License Plate:</label>
            <input type="text" id="licensePlate" name="licensePlate" required>
            <br><br>
            <label for="status">Status:</label>
            <select id="status" name="status">
                <option value="Available">Available</option>
                <option value="Assigned">Assigned</option>
                <option value="In Maintenance">In Maintenance</option>
            </select>
            <br><br>
            <button type="submit">Add Car</button>
        </form>
    </div>
</body>
</html>

