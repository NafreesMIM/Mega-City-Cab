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
import jakarta.servlet.http.HttpSession;


public class LoginServlet extends HttpServlet {
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement("SELECT * FROM users WHERE username=? AND password=?")) {
            
            ps.setString(1, username);
            ps.setString(2, password);
            
            ps.executeQuery();
            
            if (rs.next()) {
                HttpSession session = request.getSession();
                session.setAttribute("username", username);
                session.setAttribute("role", rs.getString("role"));
                
                if ("admin".equals(rs.getString("role"))) {
                    response.sendRedirect("admin_dashboard.jsp");
                } else {
                    response.sendRedirect("customer_dashboard.jsp");
                }
            } else {
                response.sendRedirect("login.jsp?error=Invalid Credentials");
            }
        } catch (SQLException e) {
            response.sendRedirect("error.jsp?msg=Database Error");
        }
    }
}
