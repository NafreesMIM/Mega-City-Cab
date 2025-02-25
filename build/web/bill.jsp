<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="models.Bill" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Bill - Mega City Cab</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
    <style>
        body {
            background-color: #f8f9fa;
        }
        .container {
            max-width: 500px;
            margin: 50px auto;
            background: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
    </style>
</head>
<body>
    <div class="container text-center">
        <h2 class="mb-4"><i class="fas fa-receipt"></i> Bill Details</h2>
        <%
            Bill bill = (Bill) request.getAttribute("bill");
            if(bill == null) {
        %>
        <div class="alert alert-warning" role="alert">
            <i class="fas fa-exclamation-circle"></i> No bill available.
        </div>
        <%
            } else {
        %>
        <p><strong>Booking ID:</strong> <%= bill.getBookingId() %></p>
        <p><strong>Base Fare:</strong> LKR <%= bill.getBaseFare() %></p>
        <p><strong>Tax (10%):</strong> LKR <%= bill.getTax() %></p>
        <p><strong>Discount (5%):</strong> LKR <%= bill.getDiscount() %></p>
        <p class="fs-4 text-primary"><strong>Total:</strong> LKR <%= bill.getTotal() %></p>
        <button class="btn btn-success mt-3" onclick="window.print()">
            <i class="fas fa-print"></i> Print Bill
        </button>
        <a href="customerDashboard.jsp" class="btn btn-secondary mt-3">
            <i class="fas fa-arrow-left"></i> Back to Dashboard
        </a>
        <% } %>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>