<%-- 
    Document   : addDriver
    Created on : Feb 24, 2025, 11:57:51 AM
    Author     : Moham
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
  <head>
    <title>Add Driver - Mega City Cab</title>
  </head>
  <body>
    <h2>Add New Driver</h2>
    <form action="driverCRUD" method="post">
      <input type="hidden" name="action" value="add" />
      <label for="name">Name:</label>
      <input type="text" name="name" id="name" required /><br/>
      <label for="licenseNumber">License Number:</label>
      <input type="text" name="licenseNumber" id="licenseNumber" required /><br/>
      <label for="contact">Contact:</label>
      <input type="text" name="contact" id="contact" required /><br/>
      <input type="submit" value="Add Driver" />
    </form>
    <p><a href="driverCRUD?action=list">Back to Manage Drivers</a></p>
  </body>
</html>

