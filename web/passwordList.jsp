<%@ page import="java.util.List" %>
<%@ page import="models.User" %>
<%
    List<User> users = (List<User>) request.getAttribute("users");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manage Passwords</title>
    <style>
        /* General body styling */
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f9;
            margin: 0;
            padding: 20px;
        }

        /* Header styling */
        h2 {
            color: #333;
            text-align: center;
            margin-bottom: 20px;
        }

        /* Table styling */
        table {
            width: 100%;
            max-width: 800px;
            margin: 0 auto;
            border-collapse: collapse;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        table th, table td {
            padding: 12px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        table th {
            background-color: #4CAF50;
            color: white;
        }

        table tr:hover {
            background-color: #f1f1f1;
        }

        /* Links styling */
        a {
            color: #007BFF;
            text-decoration: none;
            font-weight: bold;
        }

        a:hover {
            text-decoration: underline;
        }

        /* Back link */
        .back-link {
            display: block;
            text-align: center;
            margin-top: 20px;
            font-size: 16px;
        }

        /* Responsive adjustments */
        @media screen and (max-width: 768px) {
            table {
                width: 100%;
            }

            table th, table td {
                font-size: 14px;
                padding: 10px;
            }

            h2 {
                font-size: 24px;
            }

            .back-link {
                font-size: 14px;
            }
        }
    </style>
</head>
<body>
    <h2>Manage Passwords</h2>
    <table>
       <tr>
         <th>ID</th>
         <th>Username</th>
         <th>Role</th>
         <th>Action</th>
       </tr>
       <% for(User user : users) { %>
       <tr>
         <td><%= user.getId() %></td>
         <td><%= user.getUsername() %></td>
         <td><%= user.getRole() %></td>
         <td><a href="passwordCRUD?action=edit&id=<%= user.getId() %>">Change Password</a></td>
       </tr>
       <% } %>
    </table>
    <br/><a class="back-link" href="adminDashboard.jsp">Back to Dashboard</a>
</body>
</html>
