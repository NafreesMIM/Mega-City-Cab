<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="models.Vehicle" %>
<html>
  <head>
    <title>Edit Vehicle - Mega City Cab</title>
  </head>
  <body>
    <h2>Edit Vehicle</h2>
    <%
      Vehicle vehicle = (Vehicle) request.getAttribute("vehicle");
      if(vehicle == null) {
          out.println("No vehicle found.");
          return;
      }
    %>
    <form action="vehicleCRUD" method="post">
      <input type="hidden" name="action" value="update" />
      <input type="hidden" name="vehicleId" value="<%= vehicle.getVehicleId() %>" />
      <label for="licensePlate">License Plate:</label>
      <input type="text" name="licensePlate" id="licensePlate" value="<%= vehicle.getLicensePlate() %>" required /><br/>
      <label for="model">Model:</label>
      <input type="text" name="model" id="model" value="<%= vehicle.getModel() %>" required /><br/>
      <label for="brand">Brand:</label>
      <input type="text" name="brand" id="brand" value="<%= vehicle.getBrand() %>" required /><br/>
      <label for="status">Status:</label>
      <input type="text" name="status" id="status" value="<%= vehicle.getStatus() %>" required /><br/>
      <input type="submit" value="Update Vehicle" />
    </form>
    <p><a href="vehicleCRUD?action=list">Back to Manage Vehicles</a></p>
  </body>
</html>
