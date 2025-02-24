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


@WebServlet("/register")
public class RegistrationServlet extends HttpServlet {
    private final UserDAO userDAO = new UserDAO();
    private final DriverDAO driverDAO = new DriverDAO();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String username  = request.getParameter("username");
        String password  = request.getParameter("password");
        String name      = request.getParameter("name");
        String address   = request.getParameter("address");
        String telephone = request.getParameter("telephone");
        String nic       = request.getParameter("nic");
        String role      = request.getParameter("role");
        
        // Create new user record
        User newUser = new User();
        newUser.setUsername(username);
        newUser.setPassword(password);
        newUser.setName(name);
        newUser.setAddress(address);
        newUser.setTelephone(telephone);
        newUser.setNic(nic);
        newUser.setRole(role);
        
        boolean result = userDAO.register(newUser);
        if(result){
            // If registering as a driver, capture additional details and insert into drivers table.
            if(role.equalsIgnoreCase("driver")){
                // Retrieve the newly registered user record
                User registeredUser = userDAO.getUserByUsername(username);
                if(registeredUser != null){
                    String licenseNumber = request.getParameter("license_number");
                    String driverContact = request.getParameter("driver_contact");
                    
                    Driver driver = new Driver();
                    driver.setUserId(registeredUser.getId());
                    driver.setName(name);
                    driver.setLicenseNumber(licenseNumber);
                    driver.setContact(driverContact);
                    driver.setAvailable(true);
                    
                    driverDAO.addDriver(driver);
                }
            }
            response.sendRedirect("login.jsp?msg=Registration successful. Please login.");
        } else {
            request.setAttribute("error", "Registration failed. Please try again.");
            request.getRequestDispatcher("registration.jsp").forward(request, response);
        }
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("registration.jsp").forward(request, response);
    }
}
