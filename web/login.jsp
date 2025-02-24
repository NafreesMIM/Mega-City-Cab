<%-- 
    Document   : login
    Created on : Feb 23, 2025, 11:32:24 AM
    Author     : Moham
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>Login - Mega City Cab</title>
  </head>
  <body>
    <h2>Login</h2>
    <form action="login" method="post">
      <label for="username">Username:</label>
      <input type="text" name="username" id="username" required /><br/>
      <label for="password">Password:</label>
      <input type="password" name="password" id="password" required /><br/>
      <input type="submit" value="Login" />
    </form>
    <p><a href="registration.jsp">Register</a></p>
    <p style="color:red;"><%= request.getAttribute("error") != null ? request.getAttribute("error") : "" %></p>
  </body>
</html>
