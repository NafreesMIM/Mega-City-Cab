<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="models.Booking"%>
<html>
<head>
    <title>Manage Bookings - Admin</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
        }

        h2 {
            text-align: center;
            color: #333;
        }

        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px;
        }

        form {
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            margin-bottom: 20px;
        }

        form input[type="number"],
        form input[type="text"],
        form input[type="submit"] {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        form input[type="submit"] {
            background-color: #4CAF50;
            color: white;
            cursor: pointer;
        }

        form input[type="submit"]:hover {
            background-color: #45a049;
        }

        table {
            width: 100%;
            margin-top: 20px;
            border-collapse: collapse;
            background-color: #fff;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        table th, table td {
            padding: 12px;
            text-align: left;
            border: 1px solid #ddd;
        }

        table th {
            background-color: #4CAF50;
            color: white;
        }

        table td a {
            color: #2196F3;
            text-decoration: none;
        }

        table td a:hover {
            text-decoration: underline;
        }

        .actions {
            display: flex;
            gap: 10px;
        }

        .actions a {
            padding: 5px 10px;
            border-radius: 4px;
            background-color: #2196F3;
            color: white;
        }

        .actions a:hover {
            background-color: #0b7dda;
        }

        @media screen and (max-width: 768px) {
            form input[type="submit"],
            form input[type="number"],
            form input[type="text"] {
                width: 100%;
            }

            table th, table td {
                font-size: 12px;
            }

            .container {
                padding: 10px;
            }
        }

    </style>
</head>
<body>
    <div class="container">
        <h2>Manage Bookings</h2>
        <!-- Form to add new booking -->
        <form action="bookingCRUD" method="post">
            <input type="hidden" name="action" value="add" />
            <label>User ID:</label>
            <input type="number" name="userId" required /><br/>
            <label>Destination:</label>
            <input type="text" name="destination" required /><br/>
            <label>Base Fare:</label>
            <input type="number" step="0.01" name="baseFare" required /><br/>
            <input type="submit" value="Add Booking" />
        </form>

        <hr/>

        <table>
            <tr>
                <th>Booking ID</th>
                <th>User ID</th>
                <th>Destination</th>
                <th>Booking Date</th>
                <th>Base Fare</th>
                <th>Actions</th>
            </tr>
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
                <td class="actions">
                    <a href="bookingCRUD?action=edit&bookingId=<%= b.getBookingId() %>">Edit</a>
                    <a href="bookingCRUD?action=delete&bookingId=<%= b.getBookingId() %>" onclick="return confirm('Are you sure?');">Delete</a>
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
