<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="models.User" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Help - Mega City Cab</title>
  <!-- Bootstrap CSS -->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <!-- Font Awesome for icons -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
  <style>
    body {
      font-family: Arial, sans-serif;
      margin-top: 20px;
    }
    .help-section {
      background: #f9f9f9;
      border: 1px solid #ddd;
      border-radius: 8px;
      padding: 20px;
      margin-bottom: 20px;
      box-shadow: 0 2px 5px rgba(0,0,0,0.1);
    }
    h2 {
      color: #333;
      margin-bottom: 30px;
    }
    h3 {
      color: #007bff;
    }
    ul {
      list-style: none;
      padding-left: 0;
    }
    ul li {
      margin-bottom: 10px;
    }
    ul li i {
      color: #007bff;
      margin-right: 8px;
    }
    a.btn-back {
      margin-top: 20px;
    }
  </style>
</head>
<body>
  <div class="container">
    <%
      User user = (User) session.getAttribute("user");
      if (user == null) {
          out.println("<div class='alert alert-warning'>Please log in to view help information.</div>");
          return;
      }
      String role = user.getRole().toLowerCase();
    %>
    
    <h2 class="text-center"><i class="fas fa-question-circle"></i> Help &amp; Support</h2>
    
    <c:choose>
      <c:when test="${role == 'customer'}">
        <div class="help-section">
          <h3><i class="fas fa-user"></i> Customer Help</h3>
          <ul>
            <li><i class="fas fa-book"></i> <strong>Booking a Cab:</strong> Navigate to the "Book a Cab" section in your dashboard. Enter your destination and base fare to create a new booking.</li>
            <li><i class="fas fa-calendar-alt"></i> <strong>Viewing Bookings:</strong> Check the "My Bookings" page to see your booking details, including booking date and driver assignment status.</li>
            <li><i class="fas fa-receipt"></i> <strong>Billing:</strong> Once a driver is assigned, view your bill by clicking on "View Bill" to see your total fare after tax and discounts.</li>
            <li><i class="fas fa-user-cog"></i> <strong>Profile Management:</strong> Update personal details or change your password in your account settings.</li>
          </ul>
        </div>
      </c:when>
      <c:when test="${role == 'driver'}">
        <div class="help-section">
          <h3><i class="fas fa-truck"></i> Driver Help</h3>
          <ul>
            <li><i class="fas fa-toggle-on"></i> <strong>Updating Availability:</strong> Set your status as "Available" or "Not Available" to receive new assignments.</li>
            <li><i class="fas fa-bell"></i> <strong>Viewing Notifications:</strong> Check the "Notifications" section for updates regarding booking assignments and system alerts.</li>
            <li><i class="fas fa-id-badge"></i> <strong>Driver Information:</strong> Ensure your contact and license details are up-to-date by editing your profile via the dashboard.</li>
          </ul>
        </div>
      </c:when>
      <c:otherwise>
        <div class="help-section">
          <h3><i class="fas fa-info-circle"></i> Help Information</h3>
          <p>This help page is available only for customers and drivers.</p>
        </div>
      </c:otherwise>
    </c:choose>
    
    <div class="text-center">
      <a href="<%= role.equals("customer") ? "customerDashboard.jsp" : "driverDashboard.jsp" %>" class="btn btn-primary btn-back">
        <i class="fas fa-arrow-left"></i> Back to Dashboard
      </a>
    </div>
  </div>
  
  <!-- Bootstrap JS and dependencies -->
  <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
