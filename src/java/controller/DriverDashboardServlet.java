/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.DriverDAO;
import Services.INotificationService;
import Services.NotificationService;
import models.Driver;
import models.Notification;
import java.io.IOException;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

/**
 *
 * @author Moham
 */


@WebServlet("/driverDashboard")
public class DriverDashboardServlet extends HttpServlet {
    private final DriverDAO driverDAO = new DriverDAO();
    private final INotificationService notificationService = new NotificationService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        Driver driver = (Driver) session.getAttribute("user"); // assuming driver logs in with a Driver object
        if(driver == null) {
            response.sendRedirect("login.jsp");
            return;
        }
        List<Notification> notifications = notificationService.getNotificationsForUser(driver.getDriverId());
        request.setAttribute("notifications", notifications);
        request.getRequestDispatcher("driverDashboard.jsp").forward(request, response);

    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        Driver driver = (Driver) session.getAttribute("user");
        if(driver == null) {
            response.sendRedirect("login.jsp");
            return;
        }
        boolean available = Boolean.parseBoolean(request.getParameter("available"));
        driver.setAvailable(available);
        boolean updated = driverDAO.updateDriver(driver);
        if(updated) {
            session.setAttribute("user", driver);
            response.sendRedirect("driverDashboard.jsp?msg=Availability updated");
        } else {
            response.sendRedirect("driverDashboard.jsp?error=Update failed");
        }
    }
}
