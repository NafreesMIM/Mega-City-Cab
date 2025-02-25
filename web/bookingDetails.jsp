<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="models.Booking" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>My Bookings - Mega City Cab</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        body {
            background-color: #f8f9fa;
        }
        .container {
            margin-top: 30px;
        }
        .table {
            background: white;
            border-radius: 10px;
            overflow: hidden;
        }
        th, td {
            text-align: center;
            vertical-align: middle;
        }
        .pending {
            color: red;
            font-weight: bold;
        }
        .assigned {
            color: green;
            font-weight: bold;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2 class="text-center mb-4"><i class="fas fa-taxi"></i> My Bookings</h2>
        <div class="table-responsive">
            <table class="table table-striped table-hover">
                <thead class="table-dark">
                    <tr>
                        <th><i class="fas fa-list"></i> Booking ID</th>
                        <th><i class="fas fa-map-marker-alt"></i> Destination</th>
                        <th><i class="fas fa-calendar-alt"></i> Booking Date</th>
                        <th><i class="fas fa-dollar-sign"></i> Base Fare</th>
                        <th><i class="fas fa-user"></i> Driver Status</th>
                    </tr>
                </thead>
                <tbody>
                    <% List<Booking> bookings = (List<Booking>) request.getAttribute("bookings"); %>
                    <% if (bookings != null) { %>
                        <% for (Booking b : bookings) { %>
                            <tr>
                                <td><%= b.getBookingId() %></td>
                                <td><%= b.getDestination() %></td>
                                <td><%= b.getBookingDate() %></td>
                                <td>$<%= b.getBaseFare() %></td>
                                <td class="<%= b.getDriverId() == 0 ? "pending" : "assigned" %>">
                                    <%= b.getDriverId() == 0 ? "<i class='fas fa-clock'></i> Pending" : "<i class='fas fa-check-circle'></i> Driver Assigned (ID: " + b.getDriverId() + ")" %>
                                </td>
                            </tr>
                        <% } %>
                    <% } else { %>
                        <tr><td colspan="5" class="text-center">No bookings found.</td></tr>
                    <% } %>
                </tbody>
            </table>
        </div>
        <div class="text-center mt-4">
            <a href="customerDashboard.jsp" class="btn btn-primary">
                <i class="fas fa-arrow-left"></i> Back to Dashboard
            </a>
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
