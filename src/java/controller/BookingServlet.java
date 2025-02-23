/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.BookingDAO;
import models.Booking;
import models.User;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.*;
import jakarta.servlet.http.*;
import java.util.Date;

/**
 *
 * @author Moham
 */


@WebServlet("/booking")
public class BookingServlet extends HttpServlet {
    private final BookingDAO bookingDAO = new BookingDAO();

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
        
        boolean result = bookingDAO.addBooking(booking);
        if(result){
            response.sendRedirect("booking?userId=" + user.getId());
        } else {
            request.setAttribute("error", "Failed to add booking.");
            request.getRequestDispatcher("booking.jsp").forward(request, response);
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
        // Display booking details for the logged-in user
        int userId = Integer.parseInt(request.getParameter("userId"));
        request.setAttribute("bookings", bookingDAO.getBookingsByUser(userId));
        request.getRequestDispatcher("bookingDetails.jsp").forward(request, response);
    }
}
