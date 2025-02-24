/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.DriverDAO;
import models.Driver;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

/**
 *
 * @author Moham
 */

@WebServlet("/finishTrip")
public class FinishTripServlet extends HttpServlet {
    private final DriverDAO driverDAO = new DriverDAO();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        Driver driver = (Driver) session.getAttribute("driver");
        if(driver == null){
            response.sendRedirect("login.jsp");
            return;
        }
        // Mark the driver as available
        driver.setAvailable(true);
        boolean updated = driverDAO.updateDriver(driver);
        if(updated) {
            // Optionally, update session with the new driver object.
            session.setAttribute("driver", driver);
            response.sendRedirect("driverDashboard.jsp?msg=Trip finished. You are now available.");
        } else {
            response.sendRedirect("driverDashboard.jsp?error=Could not update availability.");
        }
    }
}
