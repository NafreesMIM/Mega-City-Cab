/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.BookingDAO;
import dao.DriverDAO;
import Services.INotificationService;
import Services.NotificationService;
import models.Booking;
import java.io.IOException;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

/**
 *
 * @author Moham
 */


@WebServlet("/assignDriver")
public class DriverAssignmentServlet extends HttpServlet {
    private final BookingDAO bookingDAO = new BookingDAO();
    private final DriverDAO driverDAO = new DriverDAO();
    private final INotificationService notificationService = new NotificationService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Booking> allBookings = bookingDAO.getAllBookings();
        allBookings.removeIf(b -> b.getDriverId() != 0);
        request.setAttribute("bookings", allBookings);
        request.setAttribute("drivers", driverDAO.getAvailableDrivers());
        request.getRequestDispatcher("assignDriver.jsp").forward(request, response);
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int bookingId = Integer.parseInt(request.getParameter("bookingId"));
        int driverId = Integer.parseInt(request.getParameter("driverId"));

        boolean assignResult = bookingDAO.assignDriver(bookingId, driverId);
        boolean updateDriver = driverDAO.updateDriverAvailability(driverId, false);
        
        if(assignResult && updateDriver) {
            List<Booking> bookings = bookingDAO.getAllBookings();
            Booking assignedBooking = bookings.stream()
                    .filter(b -> b.getBookingId() == bookingId)
                    .findFirst().orElse(null);
            if (assignedBooking != null) {
                int customerId = assignedBooking.getUserId();
                notificationService.sendNotification(customerId, "Booking Approved",
                        "Your booking #" + bookingId + " has been approved and a driver has been assigned.");
            }
            response.sendRedirect("adminDashboard.jsp?msg=Driver assigned successfully");
        } else {
            response.sendRedirect("adminDashboard.jsp?error=Assignment failed");
        }
    }
}
