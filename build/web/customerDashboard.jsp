<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="models.User" %>
<%
    User user = (User) session.getAttribute("user");
    if(user == null || !user.getRole().equalsIgnoreCase("customer")){
         response.sendRedirect("login.jsp");
         return;
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Customer Dashboard - Mega City Cab</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        body {
            background-color: #f8f9fa;
        }
        .dashboard-container {
            max-width: 600px;
            margin: 50px auto;
            padding: 30px;
            background: #ffffff;
            border-radius: 10px;
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
            text-align: center;
        }
        .dashboard-container h2 {
            margin-bottom: 20px;
            color: #007bff;
        }
        .dashboard-menu a {
            display: block;
            padding: 12px;
            margin: 10px 0;
            text-decoration: none;
            font-size: 18px;
            font-weight: 500;
            color: #333;
            border-radius: 8px;
            transition: all 0.3s ease-in-out;
        }
        .dashboard-menu a:hover {
            background: #007bff;
            color: white;
        }
        .dashboard-menu i {
            margin-right: 10px;
        }
    </style>
</head>
<body>
    <div class="dashboard-container">
        <h2><i class="fas fa-taxi"></i> Customer Dashboard</h2>
        <p>Welcome, <strong><%= user.getName() %></strong>!</p>
        
        <div class="dashboard-menu">
            <a href="booking.jsp"><i class="fas fa-car"></i> Book a Cab</a>
            <a href="booking?userId=<%= user.getId() %>"><i class="fas fa-list"></i> View My Bookings</a>
            <a href="bill?userId=<%= user.getId() %>"><i class="fas fa-file-invoice-dollar"></i> View Bill</a>
            <a href="help"><i class="fas fa-question-circle"></i> Help</a>
            <a href="logout" style="color: red;"><i class="fas fa-sign-out-alt"></i> Logout</a>
        </div>
        
        <p style="color:green;"><%= request.getParameter("msg") != null ? request.getParameter("msg") : "" %></p>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
