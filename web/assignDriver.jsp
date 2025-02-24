<%-- 
    Document   : assignDriver
    Created on : Feb 24, 2025, 12:22:52 PM
    Author     : Moham
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="models.Booking, models.Driver" %>
<%@ page import="java.util.List" %>
<html>
  <head>
    <title>Assign Driver to Booking</title>
    <style>
      body { font-family: Arial, sans-serif; margin: 20px; }
      h2 { color: #333; }
      label { font-weight: bold; }
      select, input[type="submit"] { margin-top: 10px; margin-bottom: 10px; }
      .message { margin-top: 15px; }
    </style>
  </head>
  <body>
    <h2>Assign Driver to Booking</h2>
    <form action="assignDriver" method="post">
      <label for="bookingId">Select Booking:</label>
      <select name="bookingId" id="bookingId" required>
        <%
          List<Booking> bookings = (List<Booking>) request.getAttribute("bookings");
          if(bookings != null && !bookings.isEmpty()){
            for(Booking b : bookings) {
        %>
          <option value="<%= b.getBookingId() %>">
            Booking #<%= b.getBookingId() %> - Destination: <%= b.getDestination() %>
          </option>
        <%
            }
          } else {
        %>
          <option value="">No unassigned bookings available</option>
        <%
          }
        %>
      </select>
      <br/><br/>
      <label for="driverId">Select Driver:</label>
      <select name="driverId" id="driverId" required>
        <%
          List<Driver> drivers = (List<Driver>) request.getAttribute("drivers");
          if(drivers != null && !drivers.isEmpty()){
            for(Driver d : drivers) {
        %>
          <option value="<%= d.getDriverId() %>">
            Driver: <%= d.getName() %> (License: <%= d.getLicenseNumber() %>)
          </option>
        <%
            }
          } else {
        %>
          <option value="">No available drivers</option>
        <%
          }
        %>
      </select>
      <br/><br/>
      <input type="submit" value="Assign Driver" />
    </form>
    <br/>
    <p><a href="adminDashboard.jsp">Back to Dashboard</a></p>
    <div class="message">
      <p style="color:green;">
        <%= request.getParameter("msg") != null ? request.getParameter("msg") : "" %>
      </p>
      <p style="color:red;">
        <%= request.getParameter("error") != null ? request.getParameter("error") : "" %>
      </p>
    </div>
  </body>
</html>

