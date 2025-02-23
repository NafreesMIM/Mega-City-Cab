<%-- 
    Document   : registration
    Created on : Feb 23, 2025, 11:33:53 AM
    Author     : Moham
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
    <title>Registration - Mega City Cab</title>
</head>
<body>
    <h2>Register as a New Customer</h2>
    <form action="register" method="post">
        Username: <input type="text" name="username" required /><br/>
        Password: <input type="password" name="password" required /><br/>
        Name: <input type="text" name="name" required /><br/>
        Address: <input type="text" name="address" required /><br/>
        Telephone: <input type="text" name="telephone" required /><br/>
        NIC: <input type="text" name="nic" required /><br/>
        <input type="submit" value="Register" />
    </form>
    <div style="color:red;">
        ${error}
    </div>
    <br/>
    <a href="login.jsp">Back to Login</a>
</body>
</html>

