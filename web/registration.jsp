<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="models.User" %>
<html lang="en">
  <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registration - Mega City Cab</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
      body {
        font-family: 'Arial', sans-serif;
        background-color: #f4f7fc;
        margin: 0;
        padding: 0;
      }
      .container {
        width: 50%;
        margin: auto;
        background-color: white;
        padding: 20px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        border-radius: 8px;
        margin-top: 50px;
      }
      h2 {
        text-align: center;
        color: #333;
      }
      label {
        font-weight: bold;
        margin-top: 10px;
        display: block;
      }
      input[type="text"],
      input[type="password"],
      select {
        width: 100%;
        padding: 10px;
        margin: 8px 0;
        border: 1px solid #ccc;
        border-radius: 4px;
        box-sizing: border-box;
      }
      input[type="submit"] {
        width: 100%;
        padding: 12px;
        background-color: #4CAF50;
        color: white;
        border: none;
        border-radius: 4px;
        font-size: 16px;
        cursor: pointer;
      }
      input[type="submit"]:hover {
        background-color: #45a049;
      }
      .form-section {
        margin-bottom: 20px;
      }
      .form-section h3 {
        color: #4CAF50;
      }
      .form-section input {
        width: 100%;
      }
      .icon {
        margin-right: 8px;
      }
      .driver-details {
        display: none;
        padding: 10px;
        background-color: #f9f9f9;
        border: 1px solid #ccc;
        border-radius: 4px;
      }
      p {
        text-align: center;
      }
      .login-link {
        display: inline-block;
        margin-top: 20px;
        color: #007BFF;
        text-decoration: none;
      }
      .login-link:hover {
        text-decoration: underline;
      }
    </style>
    <script type="text/javascript">
      function toggleDriverFields() {
        var role = document.getElementById("role").value;
        var driverFields = document.getElementById("driverFields");
        if (role === "driver") {
          driverFields.style.display = "block";
        } else {
          driverFields.style.display = "none";
        }
      }
    </script>
  </head>
  <body onload="toggleDriverFields();">
    <div class="container">
      <h2>Register</h2>
      <form action="register" method="post">
        <div class="form-section">
          <label for="username"><i class="fas fa-user icon"></i>Username:</label>
          <input type="text" name="username" id="username" required />
        </div>

        <div class="form-section">
          <label for="password"><i class="fas fa-lock icon"></i>Password:</label>
          <input type="password" name="password" id="password" required />
        </div>

        <div class="form-section">
          <label for="name"><i class="fas fa-user-circle icon"></i>Name:</label>
          <input type="text" name="name" id="name" required />
        </div>

        <div class="form-section">
          <label for="address"><i class="fas fa-home icon"></i>Address:</label>
          <input type="text" name="address" id="address" required />
        </div>

        <div class="form-section">
          <label for="telephone"><i class="fas fa-phone icon"></i>Telephone:</label>
          <input type="text" name="telephone" id="telephone" required />
        </div>

        <div class="form-section">
          <label for="nic"><i class="fas fa-id-card icon"></i>NIC:</label>
          <input type="text" name="nic" id="nic" required />
        </div>

        <div class="form-section">
          <label for="role"><i class="fas fa-users icon"></i>Register as:</label>
          <select name="role" id="role" onchange="toggleDriverFields();" required>
            <option value="customer">Customer</option>
            <option value="driver">Driver</option>
          </select>
        </div>

        <!-- Driver Specific Fields -->
        <div id="driverFields" class="driver-details">
          <h3>Driver Details</h3>
          <div class="form-section">
            <label for="license_number"><i class="fas fa-id-card icon"></i>License Number:</label>
            <input type="text" name="license_number" id="license_number" />
          </div>

          <div class="form-section">
            <label for="driver_contact"><i class="fas fa-phone icon"></i>Driver Contact:</label>
            <input type="text" name="driver_contact" id="driver_contact" />
          </div>
        </div>

        <div class="form-section">
          <input type="submit" value="Register" />
        </div>
      </form>

      <p><a href="login.jsp" class="login-link">Login</a></p>
      <p style="color:red; text-align: center;"><%= request.getAttribute("error") != null ? request.getAttribute("error") : "" %></p>
    </div>
  </body>
</html>
