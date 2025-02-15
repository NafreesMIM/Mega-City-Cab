<%-- 
    Document   : editDriver
    Created on : Feb 4, 2025, 12:24:37?PM
    Author     : Moham
--%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <title>Edit Driver - Mega City Cab</title>
    <link rel="stylesheet" type="text/css" href="styles.css">
</head>
<body>
    <div class="form-container">
        <h2>Edit Driver Details</h2>
        <form action="updateDriverServlet" method="post">
            <input type="hidden" name="id" value="${driver.id}">
            <label for="name">Driver Name:</label>
            <input type="text" id="name" name="name" value="${driver.name}" required>
            <br><br>
            <label for="phone">Phone Number:</label>
            <input type="text" id="phone" name="phone" value="${driver.phone}" required>
            <br><br>
            <label for="carAssigned">Car Assigned:</label>
            <input type="text" id="carAssigned" name="carAssigned" value="${driver.carAssigned}" required>
            <br><br>
            <button type="submit">Update Driver</button>
        </form>
    </div>
</body>
</html>

