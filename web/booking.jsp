<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>Book a Cab - Mega City Cab</title>
  </head>
  <body>
    <h2>Book a Cab</h2>
    <form action="booking" method="post">
      <label for="destination">Destination:</label>
      <input type="text" name="destination" id="destination" required /><br/>
      <label for="baseFare">Base Fare:</label>
      <input type="text" name="baseFare" id="baseFare" required /><br/>
      <input type="submit" value="Book Now" />
    </form>
    <p><a href="customerDashboard.jsp">Back to Dashboard</a></p>
  </body>
</html>
