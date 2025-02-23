<%-- 
    Document   : bill
    Created on : Feb 23, 2025, 11:38:29 AM
    Author     : Moham
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="models.Bill" %>
<html>
<head>
    <title>Bill Details - Mega City Cab</title>
</head>
<body>
    <h2>Your Bill</h2>
    <%
        Bill bill = (Bill) request.getAttribute("bill");
        if(bill != null){
    %>
    <p>Booking ID: <%= bill.getBookingId() %></p>
    <p>Base Fare: <%= bill.getBaseFare() %></p>
    <p>Tax (10%): <%= bill.getTax() %></p>
    <p>Discount (5%): <%= bill.getDiscount() %></p>
    <p>Total Amount: <%= bill.getTotal() %></p>
    <% } else { %>
        <p>No bill information available.</p>
    <% } %>
    <br/>
    <a href="customerDashboard.jsp">Back to Dashboard</a>
</body>
</html>

