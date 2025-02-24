<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
  <head>
    <title>Add Admin - Mega City Cab</title>
  </head>
  <body>
    <h2>Add New Admin</h2>
    <form action="adminCRUD" method="post">
      <input type="hidden" name="action" value="add" />
      <label for="username">Username:</label>
      <input type="text" name="username" id="username" required /><br/>
      <label for="password">Password:</label>
      <input type="password" name="password" id="password" required /><br/>
      <label for="name">Name:</label>
      <input type="text" name="name" id="name" required /><br/>
      <label for="address">Address:</label>
      <input type="text" name="address" id="address" required /><br/>
      <label for="telephone">Telephone:</label>
      <input type="text" name="telephone" id="telephone" required /><br/>
      <label for="nic">NIC:</label>
      <input type="text" name="nic" id="nic" required /><br/>
      <input type="submit" value="Add Admin" />
    </form>
    <p><a href="adminDashboard.jsp">Back to Dashboard</a></p>
  </body>
</html>
