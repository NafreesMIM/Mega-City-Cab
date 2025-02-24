<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="models.Booking" %>
<%@ page import="java.util.List" %>
<html>
  <head>
    <title>My Bookings - Mega City Cab</title>
  </head>
  <body>
    <h2>My Bookings</h2>
    <table border="1">
      <tr>
        <th>Booking ID</th>
        <th>Destination</th>
        <th>Booking Date</th>
        <th>Base Fare</th>
        <th>Driver Status</th>
      </tr>
      <%
          List<Booking> bookings = (List<Booking>) request.getAttribute("bookings");
          if(bookings != null) {
              for(Booking b : bookings) {
      %>
      <tr>
        <td><%= b.getBookingId() %></td>
        <td><%= b.getDestination() %></td>
        <td><%= b.getBookingDate() %></td>
        <td><%= b.getBaseFare() %></td>
        <td>
          <%= b.getDriverId() == 0 ? "Pending" : "Driver Assigned (ID: " + b.getDriverId() + ")" %>
        </td>
      </tr>
      <%
              }
          }
      %>
    </table>
    <p><a href="customerDashboard.jsp">Back to Dashboard</a></p>
  </body>
</html>
