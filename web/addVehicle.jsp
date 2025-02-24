<%-- 
    Document   : addVehicle
    Created on : Feb 24, 2025, 11:56:13 AM
    Author     : Moham
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
  <head>
    <title>Add Vehicle - Mega City Cab</title>
  </head>
  <body>
    <h2>Add New Vehicle</h2>
    <form action="vehicleCRUD" method="post">
      <input type="hidden" name="action" value="add" />
      <label for="licensePlate">License Plate:</label>
      <input type="text" name="licensePlate" id="licensePlate" required /><br/>
      <label for="model">Model:</label>
      <input type="text" name="model" id="model" required /><br/>
      <label for="brand">Brand:</label>
      <input type="text" name="brand" id="brand" required /><br/>
      <label for="status">Status:</label>
      <input type="text" name="status" id="status" value="available" required /><br/>
      <input type="submit" value="Add Vehicle" />
    </form>
    <p><a href="vehicleCRUD?action=list">Back to Manage Vehicles</a></p>
  </body>
</html>
