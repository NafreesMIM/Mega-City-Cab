<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="models.User" %>
<%
    User user = (User) session.getAttribute("user");
    if(user == null || !user.getRole().equalsIgnoreCase("admin")){
         response.sendRedirect("login.jsp");
         return;
    }
%>
<html>
  <head>
    <title>Registration - Mega City Cab</title>
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
    <h2>Register</h2>
    <form action="register" method="post">
      <label for="username">Username:</label>
      <input type="text" name="username" id="username" required /><br/>
      
      <label for="password">Password:</label>
      <input type="password" name="password" id="password" required /><br/>
      
      <label for="name">Name:</label>
      <input type="text" name="name" id="name" required /><br/>
      
      <label for="address">Address:</label>
      <input type="text" name="address" id="address" required /><br/>
      
      <label for="telephone">Telephone:</label>
      <input type="text" name="telephone" id="telephone" required /><br/>
      
      <label for="nic">NIC:</label>
      <input type="text" name="nic" id="nic" required /><br/>
      
      <label for="role">Register as:</label>
      <select name="role" id="role" onchange="toggleDriverFields();" required>
        <option value="customer">Customer</option>
        <option value="driver">Driver</option>
      </select><br/>
      
      <!-- Additional fields for drivers -->
      <div id="driverFields" style="display:none; border:1px solid #ccc; padding:10px; margin-top:10px;">
        <h3>Driver Details</h3>
        <label for="license_number">License Number:</label>
        <input type="text" name="license_number" id="license_number" /><br/>
        
        <label for="driver_contact">Driver Contact:</label>
        <input type="text" name="driver_contact" id="driver_contact" /><br/>
      </div>
      
      <input type="submit" value="Register" />
    </form>
    <p><a href="login.jsp">Login</a></p>
    <p style="color:red;"><%= request.getAttribute("error") != null ? request.getAttribute("error") : "" %></p>
  </body>
</html>
