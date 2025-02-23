<%-- 
    Document   : manageDrivers
    Created on : Feb 23, 2025, 11:43:05 AM
    Author     : Moham
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="models.Driver" %>
<html>
<head>
    <title>Manage Drivers - Admin</title>
</head>
<body>
    <h2>Manage Drivers</h2>
    <!-- Form to add new driver -->
    <form action="driverCRUD" method="post">
        <input type="hidden" name="action" value="add" />
        Name: <input type="text" name="name" required /><br/>
        License Number: <input type="text" name="licenseNumber" required /><br/>
        Contact: <input type="text" name="contact" required /><br/>
        <input type="submit" value="Add Driver" />
    </form>
    <hr/>
    <table border="1">
        <tr>
            <th>Driver ID</th>
            <th>Name</th>
            <th>License Number</th>
            <th>Contact</th>
            <th>Actions</th>
        </tr>
        <%
            List<Driver> drivers = (List<Driver>) request.getAttribute("drivers");
            if(drivers != null) {
                for(Driver d : drivers) {
        %>
        <tr>
            <td><%= d.getDriverId() %></td>
            <td><%= d.getName() %></td>
            <td><%= d.getLicenseNumber() %></td>
            <td><%= d.getContact() %></td>
            <td>
                <a href="driverCRUD?action=edit&driverId=<%= d.getDriverId() %>">Edit</a> |
                <a href="driverCRUD?action=delete&driverId=<%= d.getDriverId() %>" onclick="return confirm('Are you sure?');">Delete</a>
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

