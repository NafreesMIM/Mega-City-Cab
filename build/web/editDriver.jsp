<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="models.Driver" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Driver - Mega City Cab</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        body {
            background-color: #f8f9fa;
        }
        .container {
            max-width: 500px;
            margin-top: 50px;
            background: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        .form-label {
            font-weight: bold;
        }
        .btn-primary {
            width: 100%;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2 class="text-center mb-4"><i class="fa-solid fa-user-edit"></i> Edit Driver</h2>
        <%
            Driver driver = (Driver) request.getAttribute("driver");
            if(driver == null) {
                out.println("<div class='alert alert-danger'>No driver found.</div>");
                return;
            }
        %>
        <form action="driverCRUD" method="post">
            <input type="hidden" name="action" value="update">
            <input type="hidden" name="driverId" value="<%= driver.getDriverId() %>">
            
            <div class="mb-3">
                <label for="name" class="form-label"><i class="fa-solid fa-user"></i> Name</label>
                <input type="text" class="form-control" name="name" id="name" value="<%= driver.getName() %>" required>
            </div>
            
            <div class="mb-3">
                <label for="licenseNumber" class="form-label"><i class="fa-solid fa-id-card"></i> License Number</label>
                <input type="text" class="form-control" name="licenseNumber" id="licenseNumber" value="<%= driver.getLicenseNumber() %>" required>
            </div>
            
            <div class="mb-3">
                <label for="contact" class="form-label"><i class="fa-solid fa-phone"></i> Contact</label>
                <input type="text" class="form-control" name="contact" id="contact" value="<%= driver.getContact() %>" required>
            </div>
            
            <div class="mb-3">
                <label for="available" class="form-label"><i class="fa-solid fa-check-circle"></i> Available</label>
                <select class="form-select" name="available" id="available">
                    <option value="true" <%= driver.isAvailable() ? "selected" : "" %>>Yes</option>
                    <option value="false" <%= !driver.isAvailable() ? "selected" : "" %>>No</option>
                </select>
            </div>
            
            <button type="submit" class="btn btn-primary"><i class="fa-solid fa-save"></i> Update Driver</button>
        </form>
        
        <div class="text-center mt-3">
            <a href="driverCRUD?action=list" class="btn btn-secondary"><i class="fa-solid fa-arrow-left"></i> Back to Manage Drivers</a>
        </div>
    </div>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
