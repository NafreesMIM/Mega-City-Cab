/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.BookingDAO;
import models.Booking;
import models.Bill;
import java.io.IOException;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

/**
 *
 * @author Moham
 */


@WebServlet("/bill")
public class BillServlet extends HttpServlet {
    private final BookingDAO bookingDAO = new BookingDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int userId = Integer.parseInt(request.getParameter("userId"));
        List<Booking> bookings = bookingDAO.getBookingsByUser(userId);
        if(bookings.isEmpty()){
            request.setAttribute("error", "No bookings found for billing.");
            request.getRequestDispatcher("customerDashboard.jsp").forward(request, response);
            return;
        }
        Booking latestBooking = bookings.get(bookings.size() - 1);
        double tax = 0.10 * latestBooking.getBaseFare();
        double discount = 0.05 * latestBooking.getBaseFare();
        Bill bill = new Bill(latestBooking.getBookingId(), latestBooking.getBaseFare(), tax, discount);
        
        request.setAttribute("bill", bill);
        request.getRequestDispatcher("bill.jsp").forward(request, response);
    }
}
