/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.UserDAO;
import dao.DriverDAO;
import models.User;
import models.Driver;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
/**
 *
 * @author Moham
 */


@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    private final UserDAO userDAO = new UserDAO();
    private final DriverDAO driverDAO = new DriverDAO();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        User user = userDAO.authenticate(username, password);
        if(user != null){
            HttpSession session = request.getSession();
            // Always store the generic user
            session.setAttribute("user", user);
            // If the user is a driver, fetch the corresponding Driver record and store it under "driver"
            if(user.getRole() != null && user.getRole().equalsIgnoreCase("driver")){
                Driver driver = driverDAO.getDriverByUserId(user.getId());
                if(driver != null) {
                    session.setAttribute("driver", driver);
                    response.sendRedirect("driverDashboard.jsp");
                } else {
                    request.setAttribute("error", "Driver details not found. Please contact admin.");
                    request.getRequestDispatcher("login.jsp").forward(request, response);
                }
            } else if(user.getRole() != null && user.getRole().equalsIgnoreCase("admin")){
                response.sendRedirect("adminDashboard.jsp");
            } else {
                response.sendRedirect("customerDashboard.jsp");
            }
        } else {
            request.setAttribute("error", "Invalid username or password");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }
}
