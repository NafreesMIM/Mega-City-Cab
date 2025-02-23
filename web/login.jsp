<%-- 
    Document   : login
    Created on : Feb 23, 2025, 11:32:24 AM
    Author     : Moham
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Login - Mega City Cab</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            padding: 10px;
        }
        .login-container {
            background: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            text-align: center;
            width: 100%;
            max-width: 350px;
        }
        .login-container h2 {
            margin-bottom: 20px;
            color: #333;
        }
        .input-field {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        .login-btn {
            width: 100%;
            padding: 10px;
            background-color: #007BFF;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
        }
        .login-btn:hover {
            background-color: #0056b3;
        }
        .error-msg {
            color: red;
            margin-top: 10px;
        }
        .register-link {
            display: block;
            margin-top: 15px;
            color: #007BFF;
            text-decoration: none;
        }
        .register-link:hover {
            text-decoration: underline;
        }
        @media (max-width: 400px) {
            .login-container {
                padding: 15px;
            }
            .input-field, .login-btn {
                font-size: 14px;
            }
        }
    </style>
</head>
<body>
    <div class="login-container">
        <h2>Login</h2>
        <form action="login" method="post">
            <input type="text" name="username" class="input-field" placeholder="Username" required />
            <input type="password" name="password" class="input-field" placeholder="Password" required />
            <input type="submit" value="Login" class="login-btn" />
        </form>
        <div class="error-msg">
            ${error}
        </div>
        <a href="registration.jsp" class="register-link">Register as a New Customer</a>
    </div>
</body>
</html>
