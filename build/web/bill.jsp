<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="models.Bill" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Bill Details - Mega City Cab</title>
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
            background: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            text-align: center;
            width: 90%;
            max-width: 400px;
        }
        h2 {
            color: #333;
        }
        p {
            font-size: 18px;
            color: #555;
            margin: 8px 0;
        }
        .btn {
            display: inline-block;
            margin-top: 15px;
            padding: 10px 15px;
            background-color: #007BFF;
            color: white;
            text-decoration: none;
            border-radius: 5px;
            transition: background 0.3s;
        }
        .btn:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Your Bill</h2>
        <%
            Bill bill = (Bill) request.getAttribute("bill");
            if(bill != null){
        %>
        <p><strong>Booking ID:</strong> <%= bill.getBookingId() %></p>
        <p><strong>Base Fare:</strong> $<%= bill.getBaseFare() %></p>
        <p><strong>Tax (10%):</strong> $<%= bill.getTax() %></p>
        <p><strong>Discount (5%):</strong> $<%= bill.getDiscount() %></p>
        <p><strong>Total Amount:</strong> $<%= bill.getTotal() %></p>
        <% } else { %>
            <p>No bill information available.</p>
        <% } %>
        <br/>
        <a href="customerDashboard.jsp" class="btn">Back to Dashboard</a>
    </div>
</body>
</html>
