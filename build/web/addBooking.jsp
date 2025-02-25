<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Booking - Mega City Cab</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <style>
        /* General Reset */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Arial', sans-serif;
            background-color: #f4f7fc;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .container {
            background-color: #fff;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 600px;
        }

        h2 {
            text-align: center;
            color: #333;
            margin-bottom: 20px;
            font-size: 24px;
        }

        form {
            display: flex;
            flex-direction: column;
            gap: 20px;
        }

        label {
            font-weight: bold;
            color: #333;
            margin-bottom: 5px;
        }

        input[type="text"] {
            padding: 10px;
            border-radius: 5px;
            border: 1px solid #ccc;
            font-size: 16px;
            width: 100%;
        }

        input[type="submit"] {
            background-color: #4CAF50;
            color: white;
            border: none;
            padding: 15px;
            border-radius: 5px;
            font-size: 18px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        input[type="submit"]:hover {
            background-color: #45a049;
        }

        a {
            text-align: center;
            display: block;
            margin-top: 20px;
            color: #007bff;
            font-size: 16px;
            text-decoration: none;
            text-transform: uppercase;
        }

        a:hover {
            text-decoration: underline;
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            .container {
                padding: 20px;
                width: 90%;
            }

            h2 {
                font-size: 20px;
            }

            input[type="submit"] {
                padding: 12px;
                font-size: 16px;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <h2><i class="fas fa-plus-circle"></i> Add New Booking</h2>
        <form action="bookingCRUD" method="post">
            <input type="hidden" name="action" value="add" />
            <div>
                <label for="userId"><i class="fas fa-user"></i> User ID:</label>
                <input type="text" name="userId" id="userId" required />
            </div>
            <div>
                <label for="destination"><i class="fas fa-map-marker-alt"></i> Destination:</label>
                <input type="text" name="destination" id="destination" required />
            </div>
            <div class="form-group">
                <label for="baseFare">LKR Base Fare:</label>
                <input type="text" name="baseFare" id="baseFare" placeholder="Enter base fare" required>
            </div>
            <input type="submit" value="Add Booking" />
        </form>
        <p><a href="bookingCRUD?action=list"><i class="fas fa-arrow-left"></i> Back to Manage Bookings</a></p>
    </div>
</body>
</html>
