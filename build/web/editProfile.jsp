<%-- 
    Document   : editProfile
    Created on : Feb 23, 2025, 3:19:03?PM
    Author     : Moham
--%>

<%@ page import="models.User" %>
<%
    User user = (User) request.getAttribute("user");
    if(user == null){
         response.sendRedirect("login.jsp");
         return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Edit Profile - Mega City Cab</title>
</head>
<body>
    <h2>Edit Profile</h2>
    <% String message = request.getParameter("message");
       if(message != null) { %>
       <p style="color:green;"><%= message %></p>
    <% } 
       String error = (String) request.getAttribute("error");
       if(error != null) { %>
       <p style="color:red;"><%= error %></p>
    <% } %>
    <form action="profile" method="post">
        <!-- Display unique fields as read-only -->
        <p><strong>Username:</strong> <%= user.getUsername() %></p>
        <p><strong>Email:</strong> <%= user.getEmail() %></p>
        <p><strong>NIC:</strong> <%= user.getNic() %></p>
        
        <!-- Editable fields -->
        <label for="name">Full Name:</label>
        <input type="text" name="name" id="name" value="<%= user.getName() %>" required/><br/><br/>
        
        <label for="address">Address:</label>
        <input type="text" name="address" id="address" value="<%= user.getAddress() %>" required/><br/><br/>
        
        <label for="telephone">Telephone:</label>
        <input type="text" name="telephone" id="telephone" value="<%= user.getTelephone() %>" required/><br/><br/>
        
        <% if("driver".equalsIgnoreCase(user.getRole())) { %>
            <h3>Driver Specific Information</h3>
            <label for="driverLicense">Driver License Number:</label>
            <input type="text" name="driverLicense" id="driverLicense" value="<%= user.getDriverLicense() != null ? user.getDriverLicense() : "" %>"/><br/><br/>
            
            <label for="drivingExperience">Years of Driving Experience:</label>
            <input type="number" name="drivingExperience" id="drivingExperience" min="0" value="<%= user.getDrivingExperience() %>"/><br/><br/>
        <% } %>
        
        <button type="submit">Update Profile</button>
    </form>
    <br/><a href="<%= ("driver".equalsIgnoreCase(user.getRole()) ? "driverDashboard.jsp" : "customerDashboard.jsp") %>">Back to Dashboard</a>
</body>
</html>

