<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="models.Booking" %>
<html>
<head>
    <title>Booking Details - Mega City Cab</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f7f6;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        h2 {
            color: #333;
            margin-bottom: 20px;
        }
        .container {
            background-color: #fff;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            width: 80%;
            max-width: 900px;
            overflow-x: auto;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        th, td {
            padding: 12px;
            text-align: left;
            border: 1px solid #ddd;
        }
        th {
            background-color: #4CAF50;
            color: white;
        }
        td {
            background-color: #f9f9f9;
        }
        tr:nth-child(even) td {
            background-color: #f1f1f1;
        }
        a {
            text-decoration: none;
            color: #4CAF50;
            font-weight: bold;
            margin-top: 20px;
            display: inline-block;
        }
        a:hover {
            color: #45a049;
        }

        /* Responsive Styles */
        @media (max-width: 768px) {
            body {
                padding: 20px;
            }
            .container {
                padding: 15px;
                width: 100%;
            }
            table {
                font-size: 14px;
            }
        }

        @media (max-width: 480px) {
            h2 {
                font-size: 18px;
            }
            th, td {
                font-size: 12px;
                padding: 10px;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Your Bookings</h2>
        <%
            List<Booking> bookings = (List<Booking>) request.getAttribute("bookings");
            if (bookings != null && !bookings.isEmpty()) {
        %>
        <table>
            <tr>
                <th>Booking ID</th>
                <th>Destination</th>
                <th>Date</th>
                <th>Base Fare</th>
            </tr>
            <%
                for (Booking b : bookings) {
            %>
            <tr>
                <td><%= b.getBookingId() %></td>
                <td><%= b.getDestination() %></td>
                <td><%= b.getBookingDate() %></td>
                <td><%= b.getBaseFare() %></td>
            </tr>
            <%
                }
            %>
        </table>
        <% } else { %>
            <p>No bookings found.</p>
        <% } %>
        <br/>
        <a href="customerDashboard.jsp">Back to Dashboard</a>
    </div>
</body>
</html>
