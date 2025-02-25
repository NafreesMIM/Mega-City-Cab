<%@ page import="models.User" %>
<%
    User user = (User) session.getAttribute("user");
    if(user == null || !user.getRole().equalsIgnoreCase("admin")){
         response.sendRedirect("login.jsp");
         return;
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard - Mega City Cab</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        body {
            background-color: #f8f9fa;
        }
        .dashboard-container {
            max-width: 900px;
            margin: 50px auto;
            background: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        .dashboard-container h2 {
            text-align: center;
            margin-bottom: 20px;
        }
        .nav-link {
            display: flex;
            align-items: center;
            padding: 10px;
            border-radius: 5px;
            transition: all 0.3s;
        }
        .nav-link:hover {
            background-color: #007bff;
            color: white;
        }
        .nav-link i {
            margin-right: 10px;
        }
        .message {
            text-align: center;
            font-weight: bold;
        }
    </style>
</head>
<body>
    <div class="container dashboard-container">
        <h2><i class="fas fa-tachometer-alt"></i> Admin Dashboard</h2>
        <p class="text-center">Welcome, <strong><%= user.getName() %></strong>!</p>
        
        <ul class="list-group">
            <li class="list-group-item">
                <a href="vehicleCRUD?action=list" class="nav-link text-dark">
                    <i class="fas fa-car"></i> Manage Vehicles
                </a>
            </li>
            <li class="list-group-item">
                <a href="driverCRUD?action=list" class="nav-link text-dark">
                    <i class="fas fa-user-tie"></i> Manage Drivers
                </a>
            </li>
            <li class="list-group-item">
                <a href="bookingCRUD?action=list" class="nav-link text-dark">
                    <i class="fas fa-book"></i> Manage Bookings
                </a>
            </li>
            <li class="list-group-item">
                <a href="assignDriver" class="nav-link text-dark">
                    <i class="fas fa-user-check"></i> Assign Driver to Booking
                </a>
            </li>
            <li class="list-group-item">
                <a href="adminCRUD?action=add" class="nav-link text-dark">
                    <i class="fas fa-user-plus"></i> Add Admin
                </a>
            </li>
            <li class="list-group-item">
                <a href="logout" class="nav-link text-danger">
                    <i class="fas fa-sign-out-alt"></i> Logout
                </a>
            </li>
        </ul>
        
        <p class="message text-success"><%= request.getParameter("msg") != null ? request.getParameter("msg") : "" %></p>
        <p class="message text-danger"><%= request.getParameter("error") != null ? request.getParameter("error") : "" %></p>
    </div>
    
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
</body>
</html>
