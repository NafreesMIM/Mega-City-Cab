<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="models.Booking" %>
<html>
  <head>
    <title>Edit Booking - Mega City Cab</title>
  </head>
  <body>
    <h2>Edit Booking</h2>
    <%
      Booking booking = (Booking) request.getAttribute("booking");
      if(booking == null) {
          out.println("No booking found.");
          return;
      }
    %>
    <form action="bookingCRUD" method="post">
      <input type="hidden" name="action" value="update" />
      <input type="hidden" name="bookingId" value="<%= booking.getBookingId() %>" />
      <label for="destination">Destination:</label>
      <input type="text" name="destination" id="destination" value="<%= booking.getDestination() %>" required /><br/>
      <label for="baseFare">Base Fare:</label>
      <input type="text" name="baseFare" id="baseFare" value="<%= booking.getBaseFare() %>" required /><br/>
      <input type="submit" value="Update Booking" />
    </form>
    <p><a href="bookingCRUD?action=list">Back to Manage Bookings</a></p>
  </body>
</html>
