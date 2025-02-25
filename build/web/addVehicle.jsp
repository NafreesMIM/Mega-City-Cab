<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
  <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Vehicle - Mega City Cab</title>
    <!-- Link to Google Fonts for better typography -->
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500&display=swap" rel="stylesheet">
    <!-- Link to Font Awesome for icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" />
    <!-- Include your custom CSS -->
    <style>
      body {
        font-family: 'Roboto', sans-serif;
        background-color: #f4f7fc;
        margin: 0;
        padding: 0;
      }

      .container {
        max-width: 600px;
        margin: 50px auto;
        padding: 20px;
        background-color: #fff;
        box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
        border-radius: 8px;
      }

      h2 {
        text-align: center;
        color: #4CAF50;
        margin-bottom: 30px;
      }

      label {
        font-weight: 500;
        margin-bottom: 10px;
        display: block;
      }

      input[type="text"] {
        width: 100%;
        padding: 10px;
        margin: 10px 0;
        border-radius: 5px;
        border: 1px solid #ddd;
        box-sizing: border-box;
      }

      input[type="submit"] {
        background-color: #4CAF50;
        color: white;
        padding: 10px 20px;
        border: none;
        border-radius: 5px;
        font-size: 16px;
        cursor: pointer;
        width: 100%;
      }

      input[type="submit"]:hover {
        background-color: #45a049;
      }

      .form-group {
        margin-bottom: 20px;
      }

      .icon {
        margin-right: 10px;
        color: #4CAF50;
      }

      .back-link {
        text-align: center;
        display: block;
        margin-top: 20px;
        text-decoration: none;
        color: #4CAF50;
        font-weight: bold;
      }

      .back-link:hover {
        color: #45a049;
      }

      @media screen and (max-width: 768px) {
        .container {
          margin: 20px;
          padding: 15px;
        }

        h2 {
          font-size: 24px;
        }

        input[type="submit"] {
          font-size: 14px;
        }
      }
    </style>
  </head>

  <body>
    <div class="container">
      <h2><i class="fas fa-car icon"></i>Add New Vehicle</h2>
      <form action="vehicleCRUD" method="post">
        <input type="hidden" name="action" value="add" />

        <div class="form-group">
          <label for="licensePlate"><i class="fas fa-id-card icon"></i>License Plate:</label>
          <input type="text" name="licensePlate" id="licensePlate" required />
        </div>

        <div class="form-group">
          <label for="model"><i class="fas fa-cogs icon"></i>Model:</label>
          <input type="text" name="model" id="model" required />
        </div>

        <div class="form-group">
          <label for="brand"><i class="fas fa-cogs icon"></i>Brand:</label>
          <input type="text" name="brand" id="brand" required />
        </div>

        <div class="form-group">
          <label for="status"><i class="fas fa-circle icon"></i>Status:</label>
          <input type="text" name="status" id="status" value="available" required />
        </div>

        <div class="form-group">
          <input type="submit" value="Add Vehicle" />
        </div>
      </form>
      <p><a href="vehicleCRUD?action=list" class="back-link"><i class="fas fa-arrow-left icon"></i>Back to Manage Vehicles</a></p>
    </div>
  </body>
</html>
