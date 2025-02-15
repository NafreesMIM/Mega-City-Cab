<%-- 
    Document   : editCar
    Created on : Feb 4, 2025, 12:25:06?PM
    Author     : Moham
--%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <title>Edit Car - Mega City Cab</title>
    <link rel="stylesheet" type="text/css" href="styles.css">
</head>
<body>
    <div class="form-container">
        <h2>Edit Car Details</h2>
        <form action="updateCarServlet" method="post">
            <input type="hidden" name="id" value="${car.id}">
            <label for="model">Car Model:</label>
            <input type="text" id="model" name="model" value="${car.model}" required>
            <br><br>
            <label for="licensePlate">License Plate:</label>
            <input type="text" id="licensePlate" name="licensePlate" value="${car.licensePlate}" required>
            <br><br>
            <label for="status">Status:</label>
            <select id="status" name="status">
                <option value="Available" ${car.status == 'Available' ? 'selected' : ''}>Available</option>
                <option value="Assigned" ${car.status == 'Assigned' ? 'selected' : ''}>Assigned</option>
                <option value="In Maintenance" ${car.status == 'In Maintenance' ? 'selected' : ''}>In Maintenance</option>
            </select>
            <br><br>
            <button type="submit">Update Car</button>
        </form>
    </div>
</body>
</html>

