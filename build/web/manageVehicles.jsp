<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="models.Vehicle" %>
<%@ page import="java.util.List" %>
<html>
  <head>
    <title>Manage Vehicles - Mega City Cab</title>
  </head>
  <body>
    <h2>Manage Vehicles</h2>
    <p><a href="addVehicle.jsp">Add New Vehicle</a> | <a href="adminDashboard.jsp">Back to Dashboard</a></p>
    <table border="1">
      <tr>
        <th>ID</th>
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
          <a href="vehicleCRUD?action=edit&vehicleId=<%= v.getVehicleId() %>">Edit</a>
          <a href="vehicleCRUD?action=delete&vehicleId=<%= v.getVehicleId() %>" onclick="return confirm('Are you sure?');">Delete</a>
        </td>
      </tr>
      <%
              }
          }
      %>
    </table>
  </body>
</html>
