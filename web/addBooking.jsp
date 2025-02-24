<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
  <head>
    <title>Add Booking - Mega City Cab</title>
  </head>
  <body>
    <h2>Add New Booking</h2>
    <form action="bookingCRUD" method="post">
      <input type="hidden" name="action" value="add" />
      <label for="userId">User ID:</label>
      <input type="text" name="userId" id="userId" required /><br/>
      <label for="destination">Destination:</label>
      <input type="text" name="destination" id="destination" required /><br/>
      <label for="baseFare">Base Fare:</label>
      <input type="text" name="baseFare" id="baseFare" required /><br/>
      <input type="submit" value="Add Booking" />
    </form>
    <p><a href="bookingCRUD?action=list">Back to Manage Bookings</a></p>
  </body>
</html>
