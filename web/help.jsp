<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="models.User" %>
<html>
  <head>
    <title>Help - Mega City Cab</title>
    <style>
      body { font-family: Arial, sans-serif; margin: 20px; }
      h2 { color: #2a2a2a; }
      .help-section { border: 1px solid #ccc; padding: 15px; margin-bottom: 20px; }
    </style>
  </head>
  <body>
    <%
      User user = (User) session.getAttribute("user");
      if (user == null) {
          out.println("<p>Please log in to view help information.</p>");
          return;
      }
      String role = user.getRole().toLowerCase();
    %>
    
    <h2>Help &amp; Support</h2>
    
    <c:choose>
      <c:when test="${role == 'customer'}">
        <div class="help-section">
          <h3>Customer Help</h3>
          <ul>
            <li><strong>Booking a Cab:</strong> Navigate to the "Book a Cab" section in your dashboard. Enter your destination and base fare to create a new booking.</li>
            <li><strong>Viewing Bookings:</strong> Check the "My Bookings" page to see your booking details, including booking date and driver assignment status.</li>
            <li><strong>Billing:</strong> Once a driver is assigned, view your bill by clicking on "View Bill" to see your total fare after tax and discounts.</li>
            <li><strong>Profile Management:</strong> For updating personal details or changing your password, use the profile management options available in your account settings.</li>
          </ul>
        </div>
      </c:when>
      <c:when test="${role == 'driver'}">
        <div class="help-section">
          <h3>Driver Help</h3>
          <ul>
            <li><strong>Updating Availability:</strong> Use your dashboard to set your status as "Available" or "Not Available" to receive new assignments.</li>
            <li><strong>Viewing Notifications:</strong> Check the "Notifications" section on your dashboard for updates regarding booking assignments and other system alerts.</li>
            <li><strong>Driver Information:</strong> Ensure your contact and license details are up to date by editing your profile via the dashboard.</li>
          </ul>
        </div>
      </c:when>
      <c:otherwise>
        <div class="help-section">
          <h3>Help Information</h3>
          <p>This help page is available only for customers and drivers.</p>
        </div>
      </c:otherwise>
    </c:choose>
    
    <p><a href="<%= role.equals("customer") ? "customerDashboard.jsp" : "driverDashboard.jsp" %>">Back to Dashboard</a></p>
  </body>
</html>
