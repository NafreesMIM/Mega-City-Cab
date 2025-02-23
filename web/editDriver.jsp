<%-- 
    Document   : editDriver
    Created on : Feb 23, 2025, 11:43:44 AM
    Author     : Moham
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="models.Driver" %>
<html>
<head>
    <title>Edit Driver - Admin</title>
</head>
<body>
    <h2>Edit Driver</h2>
    <%
        Driver driver = (Driver) request.getAttribute("driver");
        if(driver == null) {
    %>
        <p>Driver not found.</p>
    <%
        } else {
    %>
    <form action="driverCRUD" method="post">
        <input type="hidden" name="action" value="update" />
        <input type="hidden" name="driverId" value="<%= driver.getDriverId() %>" />
        Name: <input type="text" name="name" value="<%= driver.getName() %>" required /><br/>
        License Number: <input type="text" name="licenseNumber" value="<%= driver.getLicenseNumber() %>" required /><br/>
        Contact: <input type="text" name="contact" value="<%= driver.getContact() %>" required /><br/>
        <input type="submit" value="Update Driver" />
    </form>
    <%
        }
    %>
    <br/>
    <a href="driverCRUD?action=list">Back to Manage Drivers</a>
</body>
</html>

