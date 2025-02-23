<%-- 
    Document   : addAdmin
    Created on : Feb 23, 2025, 2:20:58 PM
    Author     : Moham
--%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add New Admin</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f7f7f7;
            color: #333;
            margin: 0;
            padding: 0;
        }

        h2 {
            text-align: center;
            margin-top: 30px;
            color: #4CAF50;
        }

        form {
            max-width: 600px;
            margin: 30px auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        label {
            font-weight: bold;
            margin-bottom: 8px;
            display: block;
        }

        input[type="text"],
        input[type="password"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }

        button {
            background-color: #4CAF50;
            color: white;
            padding: 12px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            width: 100%;
        }

        button:hover {
            background-color: #45a049;
        }

        a {
            text-decoration: none;
            color: #4CAF50;
            display: block;
            text-align: center;
            margin-top: 20px;
        }

        a:hover {
            color: #45a049;
        }

        .error {
            color: red;
            text-align: center;
        }

        @media (max-width: 600px) {
            form {
                padding: 15px;
                margin: 20px;
            }

            button {
                padding: 10px;
            }

            label, input[type="text"], input[type="password"] {
                font-size: 14px;
            }
        }
    </style>
</head>
<body>
    <h2>Add New Admin</h2>
    <% String error = (String) request.getAttribute("error");
       if(error != null) { %>
       <p class="error"><%= error %></p>
    <% } %>
    <form action="adminCRUD" method="post">
        <input type="hidden" name="action" value="add"/>
        <label for="username">Username:</label>
        <input type="text" name="username" id="username" required/><br/>
        
        <label for="password">Password:</label>
        <input type="password" name="password" id="password" required/><br/>
        
        <label for="name">Name:</label>
        <input type="text" name="name" id="name" required/><br/>
        
        <label for="address">Address:</label>
        <input type="text" name="address" id="address" required/><br/>
        
        <label for="telephone">Telephone:</label>
        <input type="text" name="telephone" id="telephone" required/><br/>
        
        <label for="nic">NIC:</label>
        <input type="text" name="nic" id="nic" required/><br/>
        
        <button type="submit">Add Admin</button>
    </form>
    <a href="adminDashboard.jsp">Back to Dashboard</a>
</body>
</html>
