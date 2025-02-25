<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="models.Vehicle" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manage Vehicles - Mega City Cab</title>
    <!-- Bootstrap CSS -->
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome for icons -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet">
    <style>
      body {
        padding: 20px;
        background-color: #f8f9fa;
      }
      .table thead th {
        vertical-align: middle;
        text-align: center;
      }
      .action-icons a {
        margin-right: 10px;
        font-size: 1.2rem;
      }
      .btn-custom {
        min-width: 180px;
      }
    </style>
  </head>
  <body>
    <div class="container">
      <h2 class="my-4 text-center">Manage Vehicles</h2>
      <div class="mb-3 text-center">
        <a href="addVehicle.jsp" class="btn btn-primary btn-custom">
          <i class="fas fa-plus"></i> Add New Vehicle
        </a>
        <a href="adminDashboard.jsp" class="btn btn-secondary btn-custom">
          <i class="fas fa-tachometer-alt"></i> Back to Dashboard
        </a>
      </div>
      <div class="table-responsive">
        <table class="table table-bordered table-striped">
          <thead class="thead-dark">
            <tr>
              <th>ID</th>
              <th>License Plate</th>
              <th>Model</th>
              <th>Brand</th>
              <th>Status</th>
              <th>Actions</th>
            </tr>
          </thead>
          <tbody>
            <%
                List<Vehicle> vehicles = (List<Vehicle>) request.getAttribute("vehicles");
                if(vehicles != null) {
                    for(Vehicle v : vehicles) {
            %>
            <tr>
              <td class="text-center"><%= v.getVehicleId() %></td>
              <td class="text-center"><%= v.getLicensePlate() %></td>
              <td class="text-center"><%= v.getModel() %></td>
              <td class="text-center"><%= v.getBrand() %></td>
              <td class="text-center"><%= v.getStatus() %></td>
              <td class="action-icons text-center">
                <a href="vehicleCRUD?action=edit&vehicleId=<%= v.getVehicleId() %>" class="text-info" title="Edit">
                  <i class="fas fa-edit"></i>
                </a>
                <a href="vehicleCRUD?action=delete&vehicleId=<%= v.getVehicleId() %>" class="text-danger" title="Delete"
                   onclick="return confirm('Are you sure?');">
                  <i class="fas fa-trash-alt"></i>
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
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
  </body>
</html>
