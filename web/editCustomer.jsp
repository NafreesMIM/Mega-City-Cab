<%-- 
    Document   : editCustomer
    Created on : Feb 4, 2025, 12:22:07?PM
    Author     : Moham
--%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <title>Edit Customer - Mega City Cab</title>
    <link rel="stylesheet" type="text/css" href="styles.css">
</head>
<body>
    <div class="form-container">
        <h2>Edit Customer Details</h2>
        <form action="updateCustomerServlet" method="post">
            <input type="hidden" name="id" value="${customer.id}">
            <label for="name">Customer Name:</label>
            <input type="text" id="name" name="name" value="${customer.name}" required>
            <br><br>
            <label for="address">Address:</label>
            <input type="text" id="address" name="address" value="${customer.address}" required>
            <br><br>
            <label for="phone">Phone Number:</label>
            <input type="text" id="phone" name="phone" value="${customer.phone}" required>
            <br><br>
            <label for="nic">NIC:</label>
            <input type="text" id="nic" name="nic" value="${customer.nic}" required>
            <br><br>
            <button type="submit">Update Customer</button>
        </form>
    </div>
</body>
</html>

