/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.UserDAO;
import models.User;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.*;

/**
 *
 * @author Moham
 */


@WebServlet("/register")
public class RegistrationServlet extends HttpServlet {
    private final UserDAO userDAO = new UserDAO();

    /**
     *
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        
        String username  = request.getParameter("username");
        String password  = request.getParameter("password");
        String name      = request.getParameter("name");
        String address   = request.getParameter("address");
        String telephone = request.getParameter("telephone");
        String nic       = request.getParameter("nic");
        // Default role for new registrations is "customer"
        String role      = "customer";
        
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
            response.sendRedirect("login.jsp?msg=Registration successful. Please login.");
        } else {
            request.setAttribute("error", "Registration failed. Please try again.");
            request.getRequestDispatcher("registration.jsp").forward(request, response);
        }
    }
    
    /**
     *
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        request.getRequestDispatcher("registration.jsp").forward(request, response);
    }
}
