<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="models.User" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Password - Mega City Cab</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        body {
            background-color: #f8f9fa;
        }
        .card {
            max-width: 400px;
            margin: 50px auto;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);
        }
        .btn-custom {
            background-color: #007bff;
            color: white;
            border-radius: 5px;
        }
        .btn-custom:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="card">
            <div class="card-body text-center">
                <h2 class="mb-3"><i class="fas fa-key"></i> Edit Password</h2>
                <% User user = (User) request.getAttribute("user"); %>
                <% if (user == null) { %>
                    <p class="text-danger">User not found.</p>
                <% } else { %>
                    <form action="passwordCRUD" method="post">
                        <input type="hidden" name="action" value="update" />
                        <input type="hidden" name="id" value="<%= user.getId() %>" />
                        <div class="mb-3">
                            <label for="newPassword" class="form-label"><i class="fas fa-lock"></i> New Password</label>
                            <input type="password" name="newPassword" id="newPassword" class="form-control" required />
                        </div>
                        <button type="submit" class="btn btn-custom w-100"><i class="fas fa-save"></i> Update Password</button>
                    </form>
                <% } %>
                <p class="mt-3">
                    <a href="passwordCRUD?action=list" class="btn btn-secondary"><i class="fas fa-arrow-left"></i> Back to Password Management</a>
                </p>
            </div>
        </div>
    </div>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
</body>
</html>
