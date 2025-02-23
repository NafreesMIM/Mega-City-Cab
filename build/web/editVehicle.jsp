<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="models.Vehicle" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Vehicle - Admin</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f9;
            margin: 0;
            padding: 0;
        }
        
        h2 {
            text-align: center;
            color: #333;
        }

        .container {
            max-width: 600px;
            margin: 20px auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        form {
            display: flex;
            flex-direction: column;
        }

        input[type="text"] {
            padding: 10px;
            margin: 8px 0;
            border: 1px solid #ddd;
            border-radius: 4px;
            font-size: 14px;
        }

        input[type="submit"] {
            padding: 12px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 4px;
            font-size: 16px;
            cursor: pointer;
            margin-top: 10px;
        }

        input[type="submit"]:hover {
            background-color: #45a049;
        }

        a {
            text-decoration: none;
            color: #4CAF50;
            font-size: 16px;
            display: block;
            text-align: center;
            margin-top: 20px;
        }

        a:hover {
            color: #45a049;
        }

        @media (max-width: 768px) {
            .container {
                width: 90%;
                padding: 15px;
            }

            input[type="text"], input[type="submit"] {
                font-size: 16px;
            }
        }
    </style>
</head>
<body>
    <h2>Edit Vehicle</h2>
    <div class="container">
        <%
            Vehicle vehicle = (Vehicle) request.getAttribute("vehicle");
            if(vehicle == null) {
        %>
            <p>Vehicle not found.</p>
        <%
            } else {
        %>
        <form action="vehicleCRUD" method="post">
            <input type="hidden" name="action" value="update" />
            <input type="hidden" name="vehicleId" value="<%= vehicle.getVehicleId() %>" />
            License Plate: <input type="text" name="licensePlate" value="<%= vehicle.getLicensePlate() %>" required /><br/>
            Model: <input type="text" name="model" value="<%= vehicle.getModel() %>" required /><br/>
            Brand: <input type="text" name="brand" value="<%= vehicle.getBrand() %>" required /><br/>
            Status: <input type="text" name="status" value="<%= vehicle.getStatus() %>" required /><br/>
            <input type="submit" value="Update Vehicle" />
        </form>
        <%
            }
        %>
        <a href="vehicleCRUD?action=list">Back to Manage Vehicles</a>
    </div>
</body>
</html>
