<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="models.Vehicle"%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manage Vehicles - Admin</title>
    <style>
        /* General Styles */
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f9;
            color: #333;
        }

        h2 {
            text-align: center;
            color: #333;
        }

        .container {
            width: 80%;
            margin: 0 auto;
            padding: 20px;
        }

        form {
            background-color: #fff;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
            margin-bottom: 20px;
        }

        form input[type="text"], form input[type="submit"] {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
            border-radius: 5px;
            border: 1px solid #ddd;
        }

        form input[type="submit"] {
            background-color: #4CAF50;
            color: white;
            border: none;
            cursor: pointer;
        }

        form input[type="submit"]:hover {
            background-color: #45a049;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        table, th, td {
            border: 1px solid #ddd;
        }

        th, td {
            padding: 12px;
            text-align: left;
        }

        th {
            background-color: #4CAF50;
            color: white;
        }

        tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        tr:hover {
            background-color: #f1f1f1;
        }

        a {
            color: #4CAF50;
            text-decoration: none;
        }

        a:hover {
            text-decoration: underline;
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            .container {
                width: 90%;
            }

            table, th, td {
                font-size: 14px;
            }

            form input[type="text"], form input[type="submit"] {
                width: 100%;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Manage Vehicles</h2>
        <!-- Form to add new vehicle -->
        <form action="vehicleCRUD" method="post">
            <input type="hidden" name="action" value="add" />
            License Plate: <input type="text" name="licensePlate" required /><br/>
            Model: <input type="text" name="model" required /><br/>
            Brand: <input type="text" name="brand" required /><br/>
            Status: <input type="text" name="status" required /><br/>
            <input type="submit" value="Add Vehicle" />
        </form>
        <hr/>
        <table>
            <tr>
                <th>Vehicle ID</th>
                <th>License Plate</th>
                <th>Model</th>
                <th>Brand</th>
                <th>Status</th>
                <th>Actions</th>
            </tr>
            <%
                List<Vehicle> vehicles = (List<Vehicle>) request.getAttribute("vehicles");
                if(vehicles != null) {
                    for(Vehicle v : vehicles) {
            %>
            <tr>
                <td><%= v.getVehicleId() %></td>
                <td><%= v.getLicensePlate() %></td>
                <td><%= v.getModel() %></td>
                <td><%= v.getBrand() %></td>
                <td><%= v.getStatus() %></td>
                <td>
                    <a href="vehicleCRUD?action=edit&vehicleId=<%= v.getVehicleId() %>">Edit</a> |
                    <a href="vehicleCRUD?action=delete&vehicleId=<%= v.getVehicleId() %>" onclick="return confirm('Are you sure?');">Delete</a>
                </td>
            </tr>
            <%
                    }
                }
            %>
        </table>
        <br/>
        <a href="adminDashboard.jsp">Back to Dashboard</a>
    </div>
</body>
</html>
