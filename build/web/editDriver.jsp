<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="models.Driver" %>
<html>
  <head>
    <title>Edit Driver - Mega City Cab</title>
  </head>
  <body>
    <h2>Edit Driver</h2>
    <%
      Driver driver = (Driver) request.getAttribute("driver");
      if(driver == null) {
          out.println("No driver found.");
          return;
      }
    %>
    <form action="driverCRUD" method="post">
      <input type="hidden" name="action" value="update" />
      <input type="hidden" name="driverId" value="<%= driver.getDriverId() %>" />
      <label for="name">Name:</label>
      <input type="text" name="name" id="name" value="<%= driver.getName() %>" required /><br/>
      <label for="licenseNumber">License Number:</label>
      <input type="text" name="licenseNumber" id="licenseNumber" value="<%= driver.getLicenseNumber() %>" required /><br/>
      <label for="contact">Contact:</label>
      <input type="text" name="contact" id="contact" value="<%= driver.getContact() %>" required /><br/>
      <label for="available">Available:</label>
      <select name="available" id="available">
        <option value="true" <%= driver.isAvailable() ? "selected" : "" %>>Yes</option>
        <option value="false" <%= !driver.isAvailable() ? "selected" : "" %>>No</option>
      </select><br/>
      <input type="submit" value="Update Driver" />
    </form>
    <p><a href="driverCRUD?action=list">Back to Manage Drivers</a></p>
  </body>
</html>
