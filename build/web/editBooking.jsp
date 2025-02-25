<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="models.Booking" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Edit Booking - Mega City Cab</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- FontAwesome Icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
    <style>
        body {
            background-color: #f8f9fa;
        }
        .card {
            max-width: 500px;
            margin: 50px auto;
            border-radius: 15px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
        }
        .card-header {
            background-color: #007bff;
            color: white;
            font-size: 20px;
            text-align: center;
            border-radius: 15px 15px 0 0;
        }
        .btn-custom {
            background-color: #007bff;
            color: white;
            width: 100%;
            border-radius: 10px;
        }
        .btn-custom:hover {
            background-color: #0056b3;
        }
        .back-link {
            text-align: center;
            margin-top: 10px;
        }
    </style>
</head>
<body>

<%
    Booking booking = (Booking) request.getAttribute("booking");
    if (booking == null) {
%>
    <div class="container text-center mt-5">
        <div class="alert alert-danger" role="alert">
            <i class="fas fa-exclamation-triangle"></i> No booking found.
        </div>
    </div>
<%
        return;
    }
%>

<div class="container">
    <div class="card">
        <div class="card-header">
            <i class="fas fa-edit"></i> Edit Booking
        </div>
        <div class="card-body">
            <form action="bookingCRUD" method="post">
                <input type="hidden" name="action" value="update" />
                <input type="hidden" name="bookingId" value="<%= booking.getBookingId() %>" />

                <div class="mb-3">
                    <label for="destination" class="form-label"><i class="fas fa-map-marker-alt"></i> Destination:</label>
                    <input type="text" class="form-control" name="destination" id="destination" value="<%= booking.getDestination() %>" required>
                </div>

                <div class="mb-3">
                    <label for="baseFare" class="form-label"><i class="fas fa-dollar-sign"></i> Base Fare:</label>
                    <input type="text" class="form-control" name="baseFare" id="baseFare" value="<%= booking.getBaseFare() %>" required>
                </div>

                <button type="submit" class="btn btn-custom"><i class="fas fa-save"></i> Update Booking</button>
            </form>

            <div class="back-link">
                <a href="bookingCRUD?action=list" class="btn btn-outline-secondary"><i class="fas fa-arrow-left"></i> Back to Manage Bookings</a>
            </div>
        </div>
    </div>
</div>

<!-- Bootstrap JS (Optional, for enhanced styling) -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
