/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;


/**
 *
 * @author Moham
 */



import dao.BookingDAO;
import models.Booking;
import models.Bill;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/bill")
public class BillServlet extends HttpServlet {
    private final BookingDAO bookingDAO = new BookingDAO();

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
        // Calculate bill for the latest booking of the user
        int userId = Integer.parseInt(request.getParameter("userId"));
        List<Booking> bookings = bookingDAO.getBookingsByUser(userId);
        if(bookings.isEmpty()){
            request.setAttribute("error", "No bookings found for billing.");
            request.getRequestDispatcher("customerDashboard.jsp").forward(request, response);
            return;
        }
        Booking latestBooking = bookings.get(bookings.size() - 1);
        
        // Calculate bill: tax = 10% of baseFare, discount = 5% of baseFare (if paying online)
        double tax = 0.10 * latestBooking.getBaseFare();
        double discount = 0.05 * latestBooking.getBaseFare();
        Bill bill = new Bill(latestBooking.getBookingId(), latestBooking.getBaseFare(), tax, discount);
        
        request.setAttribute("bill", bill);
        request.getRequestDispatcher("bill.jsp").forward(request, response);
    }
}
