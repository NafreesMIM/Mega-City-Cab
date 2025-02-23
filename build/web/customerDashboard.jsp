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
    <title>Customer Dashboard - Mega City Cab</title>
</head>
<body>
    <h2>Welcome, <%= user.getName() %>!</h2>
    <p><a href="createBooking.jsp">Create a New Booking</a></p>
    <p><a href="profile">Edit Profile</a></p>
    <p><a href="logout">Logout</a></p>
</body>
</html>
