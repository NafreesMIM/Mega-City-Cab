<%-- 
    Document   : logout
    Created on : Feb 5, 2025, 6:31:49 AM
    Author     : Moham
--%>

<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Logout</title>
    <meta http-equiv="refresh" content="2;url=index.html">
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <%
        HttpSession userSession = request.getSession(false);
        if (userSession != null) {
            userSession.invalidate(); // Destroy session
        }
    %>
    
    <h2>You have been logged out successfully.</h2>
    <p>Redirecting to the home page...</p>
    
    <br>
    <a href="index.html">Click here if you are not redirected.</a>
</body>
</html>

