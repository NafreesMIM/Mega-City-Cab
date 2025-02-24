/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.BookingDAO;
import models.Booking;
import models.User;
import java.io.IOException;
import java.util.Date;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

/**
 *
 * @author Moham
 */



@WebServlet("/booking")
public class BookingServlet extends HttpServlet {
    private final BookingDAO bookingDAO = new BookingDAO();
    
    // Handles booking creation by a customer
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        if(user == null){
            response.sendRedirect("login.jsp");
            return;
        }
        
        String destination = request.getParameter("destination");
        double baseFare = Double.parseDouble(request.getParameter("baseFare"));
        
        Booking booking = new Booking();
        booking.setUserId(user.getId());
        booking.setDestination(destination);
        booking.setBookingDate(new Date());
        booking.setBaseFare(baseFare);
        // No driver is assigned at creation; we use 0 to denote this.
        booking.setDriverId(0);
        
        boolean result = bookingDAO.addBooking(booking);
        if(result){
            response.sendRedirect("booking?userId=" + user.getId());
        } else {
            request.setAttribute("error", "Failed to add booking.");
            request.getRequestDispatcher("booking.jsp").forward(request, response);
        }
    }
    
    // Displays a customer's bookings
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int userId = Integer.parseInt(request.getParameter("userId"));
        request.setAttribute("bookings", bookingDAO.getBookingsByUser(userId));
        request.getRequestDispatcher("bookingDetails.jsp").forward(request, response);
    }
}
