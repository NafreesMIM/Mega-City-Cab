<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="models.User" %>
<%
    User user = (User) session.getAttribute("user");
    if(user == null || !user.getRole().equalsIgnoreCase("customer")){
         response.sendRedirect("login.jsp");
         return;
    }
%>
<html>
  <head>
    <title>Customer Dashboard - Mega City Cab</title>
  </head>
  <body>
    <h2>Customer Dashboard</h2>
    
    <p>Welcome, <%= user.getName() %>!</p>
    <ul>
      <li><a href="booking.jsp">Book a Cab</a></li>
      <li><a href="booking?userId=<%= user.getId() %>">View My Bookings</a></li>
      <li><a href="bill?userId=<%= user.getId() %>">View Bill</a></li>
      <li><a href="help">Help</a></li>
      <li><a href="logout">Logout</a></li>
    </ul>
    <p style="color:green;"><%= request.getParameter("msg") != null ? request.getParameter("msg") : "" %></p>
  </body>
</html>
