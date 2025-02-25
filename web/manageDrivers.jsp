<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="models.Driver" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8">
    <title>Manage Drivers - Mega City Cab</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <!-- Font Awesome Icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
    <style>
      body {
        padding-top: 20px;
      }
      .table td, .table th {
        vertical-align: middle;
      }
    </style>
  </head>
  <body>
    <div class="container">
      <div class="d-flex justify-content-between align-items-center mb-3">
        <h2>Manage Drivers</h2>
        <div>
          
          <a href="adminDashboard.jsp" class="btn btn-secondary">
            <i class="fas fa-tachometer-alt"></i> Back to Dashboard
          </a>
        </div>
      </div>
      <div class="table-responsive">
        <table class="table table-bordered table-striped table-hover">
          <thead class="thead-dark">
            <tr>
              <th>ID</th>
              <th>Name</th>
              <th>License Number</th>
              <th>Contact</th>
              <th>Available</th>
              <th>Actions</th>
            </tr>
          </thead>
          <tbody>
            <%
              List<Driver> drivers = (List<Driver>) request.getAttribute("drivers");
              if(drivers != null) {
                for(Driver d : drivers) {
            %>
            <tr>
              <td><%= d.getDriverId() %></td>
              <td><%= d.getName() %></td>
              <td><%= d.getLicenseNumber() %></td>
              <td><%= d.getContact() %></td>
              <td><%= d.isAvailable() ? "Yes" : "No" %></td>
              <td>
                <a href="driverCRUD?action=edit&driverId=<%= d.getDriverId() %>" class="btn btn-primary btn-sm mr-1">
                  <i class="fas fa-edit"></i> Edit
                </a>
                <a href="driverCRUD?action=delete&driverId=<%= d.getDriverId() %>" class="btn btn-danger btn-sm" onclick="return confirm('Are you sure?');">
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
    <!-- Bootstrap JS and dependencies -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
  </body>
</html>
