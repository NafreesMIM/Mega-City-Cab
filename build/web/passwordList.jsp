<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="models.User" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Manage Passwords - Mega City Cab</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- FontAwesome for icons -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
    <style>
      body {
        background-color: #f8f9fa;
        padding-top: 20px;
      }
      h2 {
        margin-bottom: 30px;
      }
      .table thead {
        background-color: #343a40;
        color: #fff;
      }
      .btn i {
        margin-right: 5px;
      }
    </style>
  </head>
  <body>
    <div class="container">
      <h2><i class="fa-solid fa-key"></i> Manage Passwords</h2>
      <div class="table-responsive">
        <table class="table table-striped table-bordered align-middle">
          <thead>
            <tr>
              <th>User ID</th>
              <th>Username</th>
              <th>Name</th>
              <th>Actions</th>
            </tr>
          </thead>
          <tbody>
            <%
              List<User> users = (List<User>) request.getAttribute("users");
              if(users != null) {
                for(User u : users) {
            %>
            <tr>
              <td><%= u.getId() %></td>
              <td><%= u.getUsername() %></td>
              <td><%= u.getName() %></td>
              <td>
                <a href="passwordCRUD?action=edit&id=<%= u.getId() %>" class="btn btn-primary btn-sm">
                  <i class="fa-solid fa-pen-to-square"></i> Change Password
                </a>
              </td>
            </tr>
            <%
                }
              }
            %>
          </tbody>
        </table>
      </div>
      <p>
        <a href="adminDashboard.jsp" class="btn btn-secondary">
          <i class="fa-solid fa-arrow-left"></i> Back to Dashboard
        </a>
      </p>
    </div>
    <!-- Bootstrap JS Bundle (with Popper) -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
  </body>
</html>
