<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Add Admin - Mega City Cab</title>

  <!-- Font Awesome for Icons -->
  <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">

  <!-- Custom Styles -->
  <style>
    body {
      font-family: Arial, sans-serif;
      background-color: #f4f7f6;
      margin: 0;
      padding: 0;
    }

    .container {
      max-width: 800px;
      margin: 50px auto;
      padding: 20px;
      background-color: #fff;
      box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
      border-radius: 10px;
    }

    h2 {
      text-align: center;
      color: #333;
      font-size: 24px;
    }

    form {
      display: flex;
      flex-direction: column;
    }

    label {
      font-size: 16px;
      margin-bottom: 5px;
      color: #333;
    }

    input[type="text"], input[type="password"] {
      padding: 10px;
      margin-bottom: 20px;
      border-radius: 5px;
      border: 1px solid #ddd;
      font-size: 14px;
      width: 100%;
    }

    input[type="submit"] {
      background-color: #28a745;
      color: white;
      border: none;
      padding: 12px;
      border-radius: 5px;
      font-size: 16px;
      cursor: pointer;
      transition: background-color 0.3s;
    }

    input[type="submit"]:hover {
      background-color: #218838;
    }

    a {
      text-align: center;
      display: block;
      margin-top: 20px;
      font-size: 16px;
      color: #007bff;
      text-decoration: none;
    }

    a:hover {
      text-decoration: underline;
    }

    .form-group {
      display: flex;
      flex-direction: column;
    }

    /* Icons for inputs */
    .input-icon {
      display: flex;
      align-items: center;
      background-color: #f1f1f1;
      padding: 10px;
      border-radius: 5px;
      margin-bottom: 15px;
    }

    .input-icon i {
      margin-right: 10px;
      color: #888;
    }

    .input-icon input {
      border: none;
      background: none;
      outline: none;
      flex-grow: 1;
      font-size: 16px;
    }

    @media (max-width: 768px) {
      .container {
        padding: 15px;
      }

      h2 {
        font-size: 20px;
      }
    }
  </style>
</head>
<body>
  <div class="container">
    <h2><i class="fas fa-user-plus"></i> Add New Admin</h2>
    <form action="adminCRUD" method="post">
      <input type="hidden" name="action" value="add" />
      
      <div class="form-group input-icon">
        <i class="fas fa-user"></i>
        <input type="text" name="username" id="username" placeholder="Username" required />
      </div>

      <div class="form-group input-icon">
        <i class="fas fa-lock"></i>
        <input type="password" name="password" id="password" placeholder="Password" required />
      </div>

      <div class="form-group input-icon">
        <i class="fas fa-id-card"></i>
        <input type="text" name="name" id="name" placeholder="Name" required />
      </div>

      <div class="form-group input-icon">
        <i class="fas fa-map-marker-alt"></i>
        <input type="text" name="address" id="address" placeholder="Address" required />
      </div>

      <div class="form-group input-icon">
        <i class="fas fa-phone"></i>
        <input type="text" name="telephone" id="telephone" placeholder="Telephone" required />
      </div>

      <div class="form-group input-icon">
        <i class="fas fa-id-card-alt"></i>
        <input type="text" name="nic" id="nic" placeholder="NIC" required />
      </div>

      <input type="submit" value="Add Admin" />
    </form>
    <p><a href="adminDashboard.jsp"><i class="fas fa-arrow-left"></i> Back to Dashboard</a></p>
  </div>
</body>
</html>
