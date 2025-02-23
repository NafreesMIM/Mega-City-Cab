<!DOCTYPE html>
<html>
<head>
    <title>Register - Mega City Cab</title>
    <script>
        function toggleDriverFields() {
            var role = document.querySelector('input[name="role"]:checked').value;
            var driverFieldsDiv = document.getElementById("driverFields");
            if (role === "driver") {
                driverFieldsDiv.style.display = "block";
            } else {
                driverFieldsDiv.style.display = "none";
            }
        }
        window.onload = toggleDriverFields;
    </script>
</head>
<body>
    <h2>Register as a Driver or Customer</h2>
    <% String error = (String) request.getAttribute("error");
       if(error != null) { %>
       <p style="color:red;"><%= error %></p>
    <% } %>
    <form action="register" method="post">
        <label for="username">Username (Unique Identifier):</label>
        <input type="text" name="username" id="username" required/><br/><br/>
        
        <label for="email">Email Address:</label>
        <input type="email" name="email" id="email" required/><br/><br/>
        
        <label for="password">Password:</label>
        <input type="password" name="password" id="password" required/><br/><br/>
        
        <label for="name">Full Name:</label>
        <input type="text" name="name" id="name" required/><br/><br/>
        
        <label for="address">Address:</label>
        <input type="text" name="address" id="address" required/><br/><br/>
        
        <label for="telephone">Telephone:</label>
        <input type="text" name="telephone" id="telephone" required/><br/><br/>
        
        <label for="nic">NIC:</label>
        <input type="text" name="nic" id="nic" required/><br/><br/>
        
        <label>Select Role:</label>
        <input type="radio" name="role" value="customer" checked onchange="toggleDriverFields()"> Customer
        <input type="radio" name="role" value="driver" onchange="toggleDriverFields()"> Driver<br/><br/>
        
        <!-- Driver-specific fields -->
        <div id="driverFields" style="display:none;">
            <h3>Driver Specific Information</h3>
            <label for="driverLicense">Driver License Number:</label>
            <input type="text" name="driverLicense" id="driverLicense"/><br/><br/>
            
            <label for="drivingExperience">Years of Driving Experience:</label>
            <input type="number" name="drivingExperience" id="drivingExperience" min="0"/><br/><br/>
        </div>
        
        <button type="submit">Register</button>
    </form>
</body>
</html>
