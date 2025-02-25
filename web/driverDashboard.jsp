<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="models.Driver" %>
<%@ page import="models.Notification" %>
<%@ page import="java.util.List" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Driver Dashboard - Mega City Cab</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
        body {
            background-color: #f8f9fa;
        }
        .dashboard-container {
            max-width: 600px;
            margin: 50px auto;
            background: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        .notification-list li {
            list-style: none;
            padding: 10px;
            border-bottom: 1px solid #ddd;
        }
        .notification-list li:last-child {
            border-bottom: none;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="dashboard-container text-center">
            <%-- Retrieve the driver object from session stored as "driver" --%>
            <%
              // Retrieve the driver object from session stored as "driver"
              Driver driver = (Driver) session.getAttribute("driver");
              if(driver == null) {
                  response.sendRedirect("login.jsp");
                  return;
              }
              List<Notification> notifications = (List<Notification>) request.getAttribute("notifications");
            %>
            <h2><i class="fas fa-taxi text-warning"></i> Driver Dashboard</h2>
            <p class="lead">Welcome, <strong><%= driver.getName() %></strong>!</p>
            
            <h3><i class="fas fa-toggle-on"></i> Update Availability</h3>
            <p>Current Availability: <strong class="text-primary"><%= driver.isAvailable() ? "Yes" : "No" %></strong></p>
            <form action="driverDashboard" method="post">
                <input type="hidden" name="available" value="<%= !driver.isAvailable() %>" />
            </form>
            
            <h3 class="mt-4"><i class="fas fa-bell"></i> Notifications</h3>
            <ul class="notification-list">
                <% if(notifications != null && !notifications.isEmpty()) {
                     for(Notification n : notifications) { %>
                    <li><i class="fas fa-info-circle text-info"></i> <strong><%= n.getSubject() %>:</strong> <%= n.getMessage() %> <small class="text-muted">(<%= n.getTimestamp() %>)</small></li>
                <%   }
                   } else { %>
                    <li class="text-muted">No notifications.</li>
                <% } %>
            </ul>
            
            <form action="finishTrip" method="post" class="mt-3">
                <button type="submit" class="btn btn-danger w-100"><i class="fas fa-flag-checkered"></i> Finish Trip and Mark as Available</button>
            </form>
            
            <p class="mt-3"><a href="logout" class="btn btn-dark w-100"><i class="fas fa-sign-out-alt"></i> Logout</a></p>
            
            <p class="text-success"><%= request.getParameter("msg") != null ? request.getParameter("msg") : "" %></p>
            <p class="text-danger"><%= request.getParameter("error") != null ? request.getParameter("error") : "" %></p>
        </div>
    </div>
    
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
</body>
</html>
