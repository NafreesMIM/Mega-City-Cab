/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controllers;

import models.DatabaseConnection;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


/**
 *
 * @author Moham
 */
public class SignupCustomerServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        String name = request.getParameter("name");
        String nic = request.getParameter("nic");
        String address = request.getParameter("address");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement psCustomer = conn.prepareStatement("INSERT INTO customers (name, nic, address, phone, email, password) VALUES (?, ?, ?, ?, ?, ?)");
             PreparedStatement psUser = conn.prepareStatement("INSERT INTO users (username, password, role) VALUES (?, ?, 'customer')") ) {
            
            // Insert into customers table
            psCustomer.setString(1, name);
            psCustomer.setString(2, nic);
            psCustomer.setString(3, address);
            psCustomer.setString(4, phone);
            psCustomer.setString(5, email);
            psCustomer.setString(6, password);
            psCustomer.executeUpdate();
            
            // Insert into users table (username = name, password = password)
            psUser.setString(1, name);
            psUser.setString(2, password);
            psUser.executeUpdate();
            
            response.sendRedirect("login.jsp?msg=Registration Successful");
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp?msg=Database Error");
        }
    }
}