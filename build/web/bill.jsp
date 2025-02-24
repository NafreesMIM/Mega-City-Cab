<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="models.Bill" %>
<html>
  <head>
    <title>Bill - Mega City Cab</title>
  </head>
  <body>
    <h2>Bill Details</h2>
    <%
      Bill bill = (Bill) request.getAttribute("bill");
      if(bill == null) {
          out.println("No bill available.");
          return;
      }
    %>
    <p>Booking ID: <%= bill.getBookingId() %></p>
    <p>Base Fare: <%= bill.getBaseFare() %></p>
    <p>Tax (10%): <%= bill.getTax() %></p>
    <p>Discount (5%): <%= bill.getDiscount() %></p>
    <p><strong>Total: <%= bill.getTotal() %></strong></p>
    <p><a href="customerDashboard.jsp">Back to Dashboard</a></p>
  </body>
</html>
