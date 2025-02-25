<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="models.Booking" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Manage Bookings - Mega City Cab</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.6.0/css/bootstrap.min.css">
    <!-- Font Awesome for icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <style>
      body {
        background-color: #f0f2f5;
      }
      .container {
        max-width: 1200px;
      }
      .heading {
        color: #007bff;
      }
      .table-responsive {
        margin-top: 30px;
      }
      .btn {
        transition: all 0.3s ease;
      }
      .btn:hover {
        opacity: 0.8;
      }
      .action-links a {
        margin-right: 10px;
      }
      .table th {
        background-color: #007bff;
        color: white;
      }
      .table td {
        text-align: center;
      }
      .message {
        font-weight: bold;
        text-align: center;
        padding: 10px;
      }
      .message.success {
        color: #28a745;
      }
      .message.error {
        color: #dc3545;
      }
    </style>
  </head>
  <body>
    <div class="container mt-4">
      <div class="d-flex justify-content-between align-items-center mb-3">
        <h2 class="heading"><i class="fas fa-calendar-check"></i> Manage Bookings</h2>
        <div>
          <a href="addBooking.jsp" class="btn btn-success btn-lg mr-2">
            <i class="fas fa-plus"></i> Add New Booking
          </a>
          <a href="adminDashboard.jsp" class="btn btn-secondary btn-lg">
            <i class="fas fa-tachometer-alt"></i> Back to Dashboard
          </a>
        </div>
      </div>

      <!-- Success/Error Message -->
      <div class="message <%= request.getParameter("msg") != null ? "success" : "error" %>">
        <%= request.getParameter("msg") != null ? request.getParameter("msg") : request.getParameter("error") %>
      </div>

      <!-- Bookings Table -->
      <div class="table-responsive">
        <table class="table table-bordered table-hover">
          <thead>
            <tr>
              <th>ID</th>
              <th>User ID</th>
              <th>Destination</th>
              <th>Booking Date</th>
              <th>Base Fare</th>
              <th>Driver</th>
              <th>Actions</th>
            </tr>
          </thead>
          <tbody>
            <%
              List<Booking> bookings = (List<Booking>) request.getAttribute("bookings");
              if (bookings != null) {
                  for (Booking b : bookings) {
            %>
            <tr>
              <td><%= b.getBookingId() %></td>
              <td><%= b.getUserId() %></td>
              <td><%= b.getDestination() %></td>
              <td><%= b.getBookingDate() %></td>
              <td><%= b.getBaseFare() %></td>
              <td>
                <%= b.getDriverId() == 0 ? "Not Assigned" : b.getDriverId() %>
              </td>
              <td class="action-links">
                <a href="bookingCRUD?action=edit&bookingId=<%= b.getBookingId() %>" class="btn btn-info btn-sm">
                  <i class="fas fa-edit"></i> Edit
                </a>
                <a href="bookingCRUD?action=delete&bookingId=<%= b.getBookingId() %>" class="btn btn-danger btn-sm" onclick="return confirm('Are you sure you want to delete this booking?');">
                  <i class="fas fa-trash-alt"></i> Delete
                </a>
              </td>
            </tr>
            <%
                  }
              }
            %>
          </tbody>
        </table>
      </div>
    </div>

    <!-- jQuery, Popper.js, and Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.6.0/js/bootstrap.min.js"></script>
  </body>
</html>
