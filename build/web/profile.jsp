<%-- 
    Document   : profile
    Created on : Feb 5, 2025, 6:29:51 AM
    Author     : Moham
--%>

<%@ page import="java.sql.*" %>
<%@ page import="com.megacitycab.dao.UserDAO" %>
<%@ page import="com.megacitycab.model.User" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Profile</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <h2>User Profile</h2>

    <%
        HttpSession userSession = request.getSession(false);
        if (userSession == null || userSession.getAttribute("userId") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        String userId = (String) userSession.getAttribute("userId");
        User user = UserDAO.getUserById(userId);
    %>

    <form action="UpdateProfileServlet" method="post">
        <input type="hidden" name="userId" value="<%= user.getUserId() %>">

        <label>Full Name:</label>
        <input type="text" name="name" value="<%= user.getName() %>" required><br>

        <label>Email:</label>
        <input type="email" name="email" value="<%= user.getEmail() %>" required><br>

        <label>Phone Number:</label>
        <input type="text" name="phone" value="<%= user.getPhone() %>" required><br>

        <label>Address:</label>
        <input type="text" name="address" value="<%= user.getAddress() %>" required><br>

        <label>NIC (National ID):</label>
        <input type="text" name="nic" value="<%= user.getNic() %>" readonly><br>

        <label>Role:</label>
        <input type="text" name="role" value="<%= user.getRole() %>" readonly><br>

        <input type="submit" value="Update Profile">
    </form>

    <br>
    <a href="dashboard.jsp">Back to Dashboard</a>
</body>
</html>

