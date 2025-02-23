<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="models.Driver" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Driver - Admin</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
            color: #333;
        }
        .container {
            max-width: 900px;
            margin: 50px auto;
            padding: 20px;
            background-color: white;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
        }
        h2 {
            text-align: center;
            color: #333;
        }
        form {
            display: flex;
            flex-direction: column;
        }
        label {
            font-size: 1rem;
            margin-bottom: 5px;
            color: #555;
        }
        input[type="text"] {
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-size: 1rem;
        }
        input[type="submit"] {
            padding: 12px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 5px;
            font-size: 1rem;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }
        input[type="submit"]:hover {
            background-color: #45a049;
        }
        a {
            text-align: center;
            display: block;
            margin-top: 20px;
            color: #4CAF50;
            text-decoration: none;
            font-size: 1rem;
        }
        a:hover {
            text-decoration: underline;
        }
        @media (max-width: 600px) {
            .container {
                margin: 20px;
                padding: 15px;
            }
            h2 {
                font-size: 1.5rem;
            }
            input[type="text"], input[type="submit"] {
                font-size: 1rem;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Edit Driver</h2>
        <%
            Driver driver = (Driver) request.getAttribute("driver");
            if(driver == null) {
        %>
            <p>Driver not found.</p>
        <%
            } else {
        %>
        <form action="driverCRUD" method="post">
            <input type="hidden" name="action" value="update" />
            <input type="hidden" name="driverId" value="<%= driver.getDriverId() %>" />
            
            <label for="name">Name:</label>
            <input type="text" name="name" id="name" value="<%= driver.getName() %>" required />
            
            <label for="licenseNumber">License Number:</label>
            <input type="text" name="licenseNumber" id="licenseNumber" value="<%= driver.getLicenseNumber() %>" required />
            
            <label for="contact">Contact:</label>
            <input type="text" name="contact" id="contact" value="<%= driver.getContact() %>" required />
            
            <input type="submit" value="Update Driver" />
        </form>
        <%
            }
        %>
        <a href="driverCRUD?action=list">Back to Manage Drivers</a>
    </div>
</body>
</html>
