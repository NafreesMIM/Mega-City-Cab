<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="models.User" %>
<html>
  <head>
    <title>Edit Password - Mega City Cab</title>
  </head>
  <body>
    <h2>Edit Password</h2>
    <%
      User user = (User) request.getAttribute("user");
      if(user == null) {
          out.println("User not found.");
          return;
      }
    %>
    <form action="passwordCRUD" method="post">
      <input type="hidden" name="action" value="update" />
      <input type="hidden" name="id" value="<%= user.getId() %>" />
      <label for="newPassword">New Password:</label>
      <input type="password" name="newPassword" id="newPassword" required /><br/>
      <input type="submit" value="Update Password" />
    </form>
    <p><a href="passwordCRUD?action=list">Back to Password Management</a></p>
  </body>
</html>
