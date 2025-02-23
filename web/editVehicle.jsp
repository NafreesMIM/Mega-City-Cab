<%-- 
    Document   : editVehicle
    Created on : Feb 23, 2025, 11:42:28 AM
    Author     : Moham
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="models.Vehicle" %>
<html>
<head>
    <title>Edit Vehicle - Admin</title>
</head>
<body>
    <h2>Edit Vehicle</h2>
    <%
        Vehicle vehicle = (Vehicle) request.getAttribute("vehicle");
        if(vehicle == null) {
    %>
        <p>Vehicle not found.</p>
    <%
        } else {
    %>
    <form action="vehicleCRUD" method="post">
        <input type="hidden" name="action" value="update" />
        <input type="hidden" name="vehicleId" value="<%= vehicle.getVehicleId() %>" />
        License Plate: <input type="text" name="licensePlate" value="<%= vehicle.getLicensePlate() %>" required /><br/>
        Model: <input type="text" name="model" value="<%= vehicle.getModel() %>" required /><br/>
        Brand: <input type="text" name="brand" value="<%= vehicle.getBrand() %>" required /><br/>
        Status: <input type="text" name="status" value="<%= vehicle.getStatus() %>" required /><br/>
        <input type="submit" value="Update Vehicle" />
    </form>
    <%
        }
    %>
    <br/>
    <a href="vehicleCRUD?action=list">Back to Manage Vehicles</a>
</body>
</html>

