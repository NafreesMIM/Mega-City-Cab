<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="models.Vehicle" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8">
    <title>Edit Vehicle - Mega City Cab</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome CSS -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
      body {
        background-color: #f8f9fa;
      }
      .form-container {
        background: #fff;
        padding: 2rem;
        border-radius: 8px;
        box-shadow: 0 4px 8px rgba(0,0,0,0.1);
        margin-top: 2rem;
      }
      .form-title {
        margin-bottom: 1.5rem;
      }
      .btn-custom {
        background-color: #007bff;
        border: none;
      }
      .btn-custom:hover {
        background-color: #0056b3;
      }
    </style>
  </head>
  <body>
    <div class="container">
      <div class="row justify-content-center">
        <div class="col-md-6">
          <div class="form-container">
            <h2 class="form-title text-center">
              <i class="fas fa-edit"></i> Edit Vehicle
            </h2>
            <%
              Vehicle vehicle = (Vehicle) request.getAttribute("vehicle");
              if(vehicle == null) {
                  out.println("<div class='alert alert-danger'>No vehicle found.</div>");
                  return;
              }
            %>
            <form action="vehicleCRUD" method="post">
              <input type="hidden" name="action" value="update" />
              <input type="hidden" name="vehicleId" value="<%= vehicle.getVehicleId() %>" />
              
              <div class="mb-3">
                <label for="licensePlate" class="form-label">
                  <i class="fas fa-id-card"></i> License Plate:
                </label>
                <input type="text" name="licensePlate" id="licensePlate" 
                       value="<%= vehicle.getLicensePlate() %>" class="form-control" required />
              </div>
              
              <div class="mb-3">
                <label for="model" class="form-label">
                  <i class="fas fa-car"></i> Model:
                </label>
                <input type="text" name="model" id="model" 
                       value="<%= vehicle.getModel() %>" class="form-control" required />
              </div>
              
              <div class="mb-3">
                <label for="brand" class="form-label">
                  <i class="fas fa-industry"></i> Brand:
                </label>
                <input type="text" name="brand" id="brand" 
                       value="<%= vehicle.getBrand() %>" class="form-control" required />
              </div>
              
              <div class="mb-3">
                <label for="status" class="form-label">
                  <i class="fas fa-info-circle"></i> Status:
                </label>
                <input type="text" name="status" id="status" 
                       value="<%= vehicle.getStatus() %>" class="form-control" required />
              </div>
              
              <div class="d-grid">
                <button type="submit" class="btn btn-custom">
                  <i class="fas fa-save"></i> Update Vehicle
                </button>
              </div>
            </form>
            <div class="text-center mt-3">
              <a href="vehicleCRUD?action=list" class="btn btn-link">
                <i class="fas fa-arrow-left"></i> Back to Manage Vehicles
              </a>
            </div>
          </div>
        </div>
      </div>
    </div>
    <!-- Bootstrap Bundle JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
  </body>
</html>
