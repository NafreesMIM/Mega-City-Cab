<%-- 
    Document   : deleteDriver
    Created on : Feb 4, 2025, 12:25:36?PM
    Author     : Moham
--%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <title>Delete Driver - Mega City Cab</title>
    <link rel="stylesheet" type="text/css" href="styles.css">
</head>
<body>
    <div class="confirmation-container">
        <h2>Are you sure you want to delete this driver?</h2>
        <form action="deleteDriverServlet" method="post">
            <input type="hidden" name="id" value="${driver.id}">
            <button type="submit">Yes, Delete Driver</button>
            <a href="manageDrivers.jsp">Cancel</a>
        </form>
    </div>
</body>
</html>

