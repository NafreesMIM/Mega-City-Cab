<%-- 
    Document   : addCustomer
    Created on : Feb 4, 2025, 12:21:39?PM
    Author     : Moham
--%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <title>Add Customer - Mega City Cab</title>
    <link rel="stylesheet" type="text/css" href="styles.css">
</head>
<body>
    <div class="form-container">
        <h2>Add New Customer</h2>
        <form action="addCustomerServlet" method="post">
            <label for="name">Customer Name:</label>
            <input type="text" id="name" name="name" required>
            <br><br>
            <label for="address">Address:</label>
            <input type="text" id="address" name="address" required>
            <br><br>
            <label for="phone">Phone Number:</label>
            <input type="text" id="phone" name="phone" required>
            <br><br>
            <label for="nic">NIC:</label>
            <input type="text" id="nic" name="nic" required>
            <br><br>
            <button type="submit">Add Customer</button>
        </form>
    </div>
</body>
</html>

