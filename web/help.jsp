<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
    <title>Help - Mega City Cab</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f4f4f9;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            text-align: center;
        }

        .container {
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            padding: 20px;
            width: 90%;
            max-width: 700px;
            margin: 20px;
        }

        h2 {
            color: #333;
            font-size: 24px;
            margin-bottom: 20px;
        }

        p {
            font-size: 16px;
            line-height: 1.6;
            color: #555;
            margin-bottom: 10px;
        }

        a {
            display: inline-block;
            margin-top: 20px;
            text-decoration: none;
            font-size: 16px;
            color: #007BFF;
            border: 2px solid #007BFF;
            padding: 8px 20px;
            border-radius: 4px;
            transition: background-color 0.3s, color 0.3s;
        }

        a:hover {
            background-color: #007BFF;
            color: #fff;
        }

        @media (max-width: 768px) {
            h2 {
                font-size: 20px;
            }

            p {
                font-size: 14px;
            }

            .container {
                padding: 15px;
            }

            a {
                font-size: 14px;
                padding: 6px 16px;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Help and Usage Guidelines</h2>
        <p>1. Login with your registered username and password.</p>
        <p>2. For customers, create a new booking by entering your destination and base fare.</p>
        <p>3. For admins, use the management pages to handle bookings, vehicles, and drivers.</p>
        <p>4. View your bookings and calculate your bill (tax is 10% and online payment discount is 5%).</p>
        <p>5. For further assistance, contact support at <a href="mailto:support@megacitycab.com">support@megacitycab.com</a>.</p>
        <a href="customerDashboard.jsp">Back to Dashboard</a>
    </div>
</body>
</html>
