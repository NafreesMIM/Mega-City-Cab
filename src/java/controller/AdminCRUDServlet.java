/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.UserDAO;
import models.User;
import java.io.IOException;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

/**
 *
 * @author Moham
 */


@WebServlet("/adminCRUD")
public class AdminCRUDServlet extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action != null && action.equals("add")) {
            RequestDispatcher dispatcher = request.getRequestDispatcher("addAdmin.jsp");
            dispatcher.forward(request, response);
        }
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action.equals("add")) {
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            String name = request.getParameter("name");
            String address = request.getParameter("address");
            String telephone = request.getParameter("telephone");
            String nic = request.getParameter("nic");
            
            User newAdmin = new User();
            newAdmin.setUsername(username);
            newAdmin.setPassword(password);
            newAdmin.setName(name);
            newAdmin.setAddress(address);
            newAdmin.setTelephone(telephone);
            newAdmin.setNic(nic);
            newAdmin.setRole("admin");
            
            UserDAO dao = new UserDAO();
            boolean registered = dao.register(newAdmin);
            if (registered) {
                response.sendRedirect("adminDashboard.jsp");
            } else {
                request.setAttribute("error", "Failed to register admin.");
                RequestDispatcher dispatcher = request.getRequestDispatcher("addAdmin.jsp");
                dispatcher.forward(request, response);
            }
        }
    }
}
