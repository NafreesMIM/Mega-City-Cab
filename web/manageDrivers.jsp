<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="models.Driver" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manage Drivers - Admin</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEJ+N6f6X7tW9EEN54Fmf6CC0H9eKnQ2VpWdykLfN1v7Y1tOpHETVmf4y4xzS" crossorigin="anonymous">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f6f9;
        }
        .container {
            max-width: 960px;
            margin-top: 30px;
        }
        h2 {
            text-align: center;
            margin-bottom: 20px;
            font-size: 2rem;
        }
        table {
            margin-top: 20px;
        }
        table th, table td {
            text-align: center;
        }
        .action-links a {
            margin: 0 10px;
        }
        .back-btn {
            margin-top: 20px;
            display: block;
            text-align: center;
        }
        /* Responsive adjustments */
        @media (max-width: 768px) {
            .container {
                padding-left: 15px;
                padding-right: 15px;
            }
            h2 {
                font-size: 1.5rem;
            }
            table th, table td {
                font-size: 0.9rem;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Manage Drivers</h2>

        <!-- Form to add new driver -->
        <form action="driverCRUD" method="post" class="mb-4">
            <input type="hidden" name="action" value="add" />
            <div class="row">
                <div class="col-md-6 mb-3">
                    <label for="name" class="form-label">Name</label>
                    <input type="text" name="name" id="name" class="form-control" required />
                </div>
                <div class="col-md-6 mb-3">
                    <label for="licenseNumber" class="form-label">License Number</label>
                    <input type="text" name="licenseNumber" id="licenseNumber" class="form-control" required />
                </div>
                <div class="col-md-6 mb-3">
                    <label for="contact" class="form-label">Contact</label>
                    <input type="text" name="contact" id="contact" class="form-control" required />
                </div>
                <div class="col-md-12 text-center">
                    <button type="submit" class="btn btn-primary">Add Driver</button>
                </div>
            </div>
        </form>

        <hr/>

        <!-- Driver Table -->
        <table class="table table-bordered table-striped">
            <thead class="table-dark">
                <tr>
                    <th>Driver ID</th>
                    <th>Name</th>
                    <th>License Number</th>
                    <th>Contact</th>
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
                    <td class="action-links">
                        <a href="driverCRUD?action=edit&driverId=<%= d.getDriverId() %>" class="btn btn-warning btn-sm">Edit</a>
                        <a href="driverCRUD?action=delete&driverId=<%= d.getDriverId() %>" class="btn btn-danger btn-sm" onclick="return confirm('Are you sure?');">Delete</a>
                    </td>
                </tr>
                <%
                        }
                    }
                %>
            </tbody>
        </table>

        <div class="back-btn">
            <a href="adminDashboard.jsp" class="btn btn-secondary">Back to Dashboard</a>
        </div>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pzjw8f+ua7Kw1TIq0+JsE2l5+rw4VYovz0xctmINm6n5fllcgZSSUGB+10ptXzmz" crossorigin="anonymous"></script>
</body>
</html>
