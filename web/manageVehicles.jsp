<%-- 
    Document   : manageVehicles
    Created on : Feb 23, 2025, 11:41:52 AM
    Author     : Moham
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="models.Vehicle"%>
<html>
<head>
    <title>Manage Vehicles - Admin</title>
</head>
<body>
    <h2>Manage Vehicles</h2>
    <!-- Form to add new vehicle -->
    <form action="vehicleCRUD" method="post">
        <input type="hidden" name="action" value="add" />
        License Plate: <input type="text" name="licensePlate" required /><br/>
        Model: <input type="text" name="model" required /><br/>
        Brand: <input type="text" name="brand" required /><br/>
        Status: <input type="text" name="status" required /><br/>
        <input type="submit" value="Add Vehicle" />
    </form>
    <hr/>
    <table border="1">
        <tr>
            <th>Vehicle ID</th>
            <th>License Plate</th>
            <th>Model</th>
            <th>Brand</th>
            <th>Status</th>
            <th>Actions</th>
        </tr>
        <%
            List<Vehicle> vehicles = (List<Vehicle>) request.getAttribute("vehicles");
            if(vehicles != null) {
                for(Vehicle v : vehicles) {
        %>
        <tr>
            <td><%= v.getVehicleId() %></td>
            <td><%= v.getLicensePlate() %></td>
            <td><%= v.getModel() %></td>
            <td><%= v.getBrand() %></td>
            <td><%= v.getStatus() %></td>
            <td>
                <a href="vehicleCRUD?action=edit&vehicleId=<%= v.getVehicleId() %>">Edit</a> |
                <a href="vehicleCRUD?action=delete&vehicleId=<%= v.getVehicleId() %>" onclick="return confirm('Are you sure?');">Delete</a>
            </td>
        </tr>
        <%
                }
            }
        %>
    </table>
    <br/>
    <a href="adminDashboard.jsp">Back to Dashboard</a>
</body>
</html>

