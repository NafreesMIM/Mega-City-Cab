<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="models.Booking" %>
<html>
<head>
    <title>Edit Booking - Admin</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .container {
            background-color: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 500px;
            margin: 20px;
        }

        h2 {
            text-align: center;
            color: #333;
        }

        form {
            display: flex;
            flex-direction: column;
        }

        input[type="text"],
        input[type="number"],
        input[type="submit"] {
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 4px;
            font-size: 16px;
        }

        input[type="submit"] {
            background-color: #4CAF50;
            color: white;
            cursor: pointer;
        }

        input[type="submit"]:hover {
            background-color: #45a049;
        }

        a {
            text-decoration: none;
            color: #007bff;
            font-size: 16px;
            display: block;
            text-align: center;
        }

        a:hover {
            text-decoration: underline;
        }

        @media (max-width: 600px) {
            .container {
                padding: 15px;
                width: 90%;
            }

            input[type="text"],
            input[type="number"],
            input[type="submit"] {
                font-size: 14px;
                padding: 8px;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Edit Booking</h2>
        <%
            Booking booking = (Booking) request.getAttribute("booking");
            if(booking == null) {
        %>
            <p>Booking not found.</p>
        <%
            } else {
        %>
        <form action="bookingCRUD" method="post">
            <input type="hidden" name="action" value="update" />
            <input type="hidden" name="bookingId" value="<%= booking.getBookingId() %>" />
            Destination: <input type="text" name="destination" value="<%= booking.getDestination() %>" required /><br/>
            Base Fare: <input type="number" step="0.01" name="baseFare" value="<%= booking.getBaseFare() %>" required /><br/>
            <input type="submit" value="Update Booking" />
        </form>
        <%
            }
        %>
        <br/>
        <a href="bookingCRUD?action=list">Back to Manage Bookings</a>
    </div>
</body>
</html>
