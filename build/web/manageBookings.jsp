<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="models.Booking" %>
<%@ page import="java.util.List" %>
<html>
  <head>
    <title>Manage Bookings - Mega City Cab</title>
  </head>
  <body>
    <h2>Manage Bookings</h2>
    <p><a href="addBooking.jsp">Add New Booking</a> | <a href="adminDashboard.jsp">Back to Dashboard</a></p>
    <table border="1">
      <tr>
        <th>ID</th>
        <th>User ID</th>
        <th>Destination</th>
        <th>Booking Date</th>
        <th>Base Fare</th>
        <th>Driver</th>
        <th>Actions</th>
      </tr>
      <%
          List<Booking> bookings = (List<Booking>) request.getAttribute("bookings");
          if(bookings != null) {
              for(Booking b : bookings) {
      %>
      <tr>
        <td><%= b.getBookingId() %></td>
        <td><%= b.getUserId() %></td>
        <td><%= b.getDestination() %></td>
        <td><%= b.getBookingDate() %></td>
        <td><%= b.getBaseFare() %></td>
        <td><%= b.getDriverId() == 0 ? "Not Assigned" : b.getDriverId() %></td>
        <td>
          <a href="bookingCRUD?action=edit&bookingId=<%= b.getBookingId() %>">Edit</a>
          <a href="bookingCRUD?action=delete&bookingId=<%= b.getBookingId() %>" onclick="return confirm('Are you sure?');">Delete</a>
        </td>
      </tr>
      <%
              }
          }
      %>
    </table>
  </body>
</html>
