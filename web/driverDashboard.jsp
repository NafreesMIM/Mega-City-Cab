<%-- 
    Document   : driverDashboard
    Created on : Feb 23, 2025, 3:20:36?PM
    Author     : Moham
--%>

<%@ page import="java.util.List" %>
<%@ page import="models.Booking" %>
<%@ page import="models.User" %>
<%
    User user = (User) session.getAttribute("user");
    if(user == null || !user.getRole().equalsIgnoreCase("driver")){
         response.sendRedirect("login.jsp");
         return;
    }
    List<Booking> bookings = (List<Booking>) request.getAttribute("bookings");
%>
<!DOCTYPE html>
<html>
<head>
    <title>Driver Dashboard - Mega City Cab</title>
    <style>
        body { font-family: Arial, sans-serif; background: #f4f4f4; margin:0; padding:0; }
        .header { background:#333; color:white; padding:15px; text-align:center; }
        .container { width:80%; margin:20px auto; background:white; padding:20px; 
                     box-shadow: 0px 0px 10px rgba(0,0,0,0.1); border-radius:8px; }
        table { width:100%; border-collapse: collapse; }
        th, td { padding:10px; border:1px solid #ddd; text-align:left; }
        th { background:#007BFF; color:white; }
    </style>
</head>
<body>
    <div class="header">Driver Dashboard - Mega City Cab</div>
    <div class="container">
        <h2>Welcome, <%= user.getName() %>!</h2>
        <h3>Your Assigned Bookings</h3>
        <table>
            <tr>
                <th>Booking ID</th>
                <th>Customer Name</th>
                <th>Car Model</th>
                <th>License Plate</th>
                <th>Status</th>
            </tr>
            <% if(bookings != null && !bookings.isEmpty()) {
                   for(Booking b : bookings) { %>
                   <tr>
                       <td><%= b.getId() %></td>
                       <td><%= b.getCustomer().getName() %></td>
                       <td><%= b.getCar().getModel() %></td>
                       <td><%= b.getCar().getLicensePlate() %></td>
                       <td><%= b.getStatus() %></td>
                   </tr>
            <%   }
               } else { %>
               <tr>
                   <td colspan="5">No bookings assigned.</td>
               </tr>
            <% } %>
        </table>
        <br/><a href="profile">Edit Profile</a>
        <br/><a href="logout">Logout</a>
    </div>
</body>
</html>

