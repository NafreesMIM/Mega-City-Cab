
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="models.Booking, models.Driver" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Assign Driver to Booking</title>
    <script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .container {
            background: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
            width: 90%;
            max-width: 500px;
        }
        h2 {
            text-align: center;
            color: #333;
        }
        label {
            font-weight: bold;
            display: block;
            margin: 10px 0 5px;
        }
        select, input[type="submit"] {
            width: 100%;
            padding: 10px;
            margin-top: 5px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        input[type="submit"] {
            background-color: #28a745;
            color: white;
            font-size: 16px;
            cursor: pointer;
            transition: background 0.3s;
        }
        input[type="submit"]:hover {
            background-color: #218838;
        }
        .message {
            text-align: center;
            margin-top: 15px;
            font-size: 14px;
        }
        .back-link {
            display: flex;
            justify-content: center;
            margin-top: 20px;
            text-decoration: none;
            color: #007bff;
            font-size: 16px;
        }
        .back-link:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2><i class="fas fa-car"></i> Assign Driver to Booking</h2>
        <form action="assignDriver" method="post">
            <label for="bookingId"><i class="fas fa-taxi"></i> Select Booking:</label>
            <select name="bookingId" id="bookingId" required>
                <% List<Booking> bookings = (List<Booking>) request.getAttribute("bookings");
                   if (bookings != null && !bookings.isEmpty()) {
                       for (Booking b : bookings) { %>
                <option value="<%= b.getBookingId() %>">Booking #<%= b.getBookingId() %> - Destination: <%= b.getDestination() %></option>
                <%   }
                   } else { %>
                <option value="">No unassigned bookings available</option>
                <% } %>
            </select>
            
            <label for="driverId"><i class="fas fa-user-tie"></i> Select Driver:</label>
            <select name="driverId" id="driverId" required>
                <% List<Driver> drivers = (List<Driver>) request.getAttribute("drivers");
                   if (drivers != null && !drivers.isEmpty()) {
                       for (Driver d : drivers) { %>
                <option value="<%= d.getDriverId() %>">Driver: <%= d.getName() %> (License: <%= d.getLicenseNumber() %>)</option>
                <%   }
                   } else { %>
                <option value="">No available drivers</option>
                <% } %>
            </select>
            
            <input type="submit" value="Assign Driver" />
        </form>
        
        <div class="message">
            <p style="color:green;"><%= request.getParameter("msg") != null ? request.getParameter("msg") : "" %></p>
            <p style="color:red;"><%= request.getParameter("error") != null ? request.getParameter("error") : "" %></p>
        </div>
        
        <a href="adminDashboard.jsp" class="back-link"><i class="fas fa-arrow-left"></i> Back to Dashboard</a>
    </div>
</body>
</html>
