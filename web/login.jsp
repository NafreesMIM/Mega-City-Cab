<%-- 
    Document   : login
    Created on : Feb 23, 2025, 11:32:24 AM
    Author     : Moham
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
    <title>Login - Mega City Cab</title>
</head>
<body>
    <h2>Login</h2>
    <form action="login" method="post">
        Username: <input type="text" name="username" required /><br/>
        Password: <input type="password" name="password" required /><br/>
        <input type="submit" value="Login" />
    </form>
    <div style="color:red;">
        ${error}
    </div>
    <br/>
    <a href="registration.jsp">Register as a New Customer</a>
</body>
</html>

