<%-- 
    Document   : createBooking
    Created on : Feb 23, 2025, 3:21:44?PM
    Author     : Moham
--%>

<%@ page import="models.User" %>
<%
    User user = (User) session.getAttribute("user");
    if(user == null || !user.getRole().equalsIgnoreCase("customer")){
         response.sendRedirect("login.jsp");
         return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Create Booking - Mega City Cab</title>
</head>
<body>
    <h2>Create a Booking</h2>
    <% String error = request.getParameter("error");
       if(error != null) { %>
       <p style="color:red;"><%= error %></p>
    <% } %>
    <form action="bookingCRUD" method="post">
        <input type="hidden" name="action" value="createBooking"/>
        <!-- For demonstration, assume customer enters a Car ID manually -->
        <label for="carId">Car ID:</label>
        <input type="text" name="carId" id="carId" required/><br/><br/>
        <button type="submit">Book Now</button>
    </form>
    <br/><a href="customerDashboard.jsp">Back to Dashboard</a>
</body>
</html>

