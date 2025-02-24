<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="models.User" %>
<%@ page import="java.util.List" %>
<html>
  <head>
    <title>Manage Passwords - Mega City Cab</title>
  </head>
  <body>
    <h2>Manage Passwords</h2>
    <table border="1">
      <tr>
        <th>User ID</th>
        <th>Username</th>
        <th>Name</th>
        <th>Actions</th>
      </tr>
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
          <a href="passwordCRUD?action=edit&id=<%= u.getId() %>">Change Password</a>
        </td>
      </tr>
      <%
              }
          }
      %>
    </table>
    <p><a href="adminDashboard.jsp">Back to Dashboard</a></p>
  </body>
</html>
