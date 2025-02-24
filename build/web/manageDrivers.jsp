<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="models.Driver" %>
<%@ page import="java.util.List" %>
<html>
  <head>
    <title>Manage Drivers - Mega City Cab</title>
  </head>
  <body>
    <h2>Manage Drivers</h2>
    <p><a href="addDriver.jsp">Add New Driver</a> | <a href="adminDashboard.jsp">Back to Dashboard</a></p>
    <table border="1">
      <tr>
        <th>ID</th>
        <th>Name</th>
        <th>License Number</th>
        <th>Contact</th>
        <th>Available</th>
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
        <td><%= d.isAvailable() ? "Yes" : "No" %></td>
        <td>
          <a href="driverCRUD?action=edit&driverId=<%= d.getDriverId() %>">Edit</a>
          <a href="driverCRUD?action=delete&driverId=<%= d.getDriverId() %>" onclick="return confirm('Are you sure?');">Delete</a>
        </td>
      </tr>
      <%
              }
          }
      %>
    </table>
  </body>
</html>
