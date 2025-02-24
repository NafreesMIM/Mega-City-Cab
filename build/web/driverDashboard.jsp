<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="models.Driver" %>
<%@ page import="models.Notification" %>
<%@ page import="java.util.List" %>
<html>
  <head>
    <title>Driver Dashboard - Mega City Cab</title>
  </head>
  <body>
    <h2>Driver Dashboard</h2>
    <%
      // Retrieve the driver object from session stored as "driver"
      Driver driver = (Driver) session.getAttribute("driver");
      if(driver == null) {
          response.sendRedirect("login.jsp");
          return;
      }
      List<Notification> notifications = (List<Notification>) request.getAttribute("notifications");
    %>
    <p>Welcome, <%= driver.getName() %>!</p>
    
    <h3>Update Availability</h3>
<p>Current Availability: <strong><%= driver.isAvailable() ? "Yes" : "No" %></strong></p>
<form action="driverDashboard" method="post">
  <%-- Toggle the availability: submit the opposite value --%>
  <input type="hidden" name="available" value="<%= !driver.isAvailable() %>" />
</form>

    
    <h3>Notifications</h3>
    <ul>
      <% if(notifications != null && !notifications.isEmpty()) {
           for(Notification n : notifications) { %>
          <li><strong><%= n.getSubject() %>:</strong> <%= n.getMessage() %> (<%= n.getTimestamp() %>)</li>
      <%   }
         } else { %>
          <li>No notifications.</li>
      <% } %>
    </ul>
    
    <form action="finishTrip" method="post">
      <input type="submit" value="Finish Trip and Mark as Available" />
    </form>
    
    <p><a href="logout">Logout</a></p>
    <p style="color:green;"><%= request.getParameter("msg") != null ? request.getParameter("msg") : "" %></p>
    <p style="color:red;"><%= request.getParameter("error") != null ? request.getParameter("error") : "" %></p>
  </body>
</html>
