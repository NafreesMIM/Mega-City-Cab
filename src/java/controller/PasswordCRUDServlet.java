/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.UserDAO;
import models.User;
import java.io.IOException;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

/**
 *
 * @author Moham
 */




@WebServlet("/passwordCRUD")
public class PasswordCRUDServlet extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null || action.equals("list")) {
            listUsers(request, response);
        } else if (action.equals("edit")) {
            int userId = Integer.parseInt(request.getParameter("id"));
            UserDAO dao = new UserDAO();
            User user = dao.getUserById(userId);
            request.setAttribute("user", user);
            RequestDispatcher dispatcher = request.getRequestDispatcher("editPassword.jsp");
            dispatcher.forward(request, response);
        }
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action.equals("update")) {
            int userId = Integer.parseInt(request.getParameter("id"));
            String newPassword = request.getParameter("newPassword");
            UserDAO dao = new UserDAO();
            boolean updated = dao.updatePassword(userId, newPassword);
            response.sendRedirect("passwordCRUD?action=list");
        }
    }
    
    private void listUsers(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        UserDAO dao = new UserDAO();
        List<User> users = dao.getAllUsers();
        request.setAttribute("users", users);
        RequestDispatcher dispatcher = request.getRequestDispatcher("passwordList.jsp");
        dispatcher.forward(request, response);
    }
}
