/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.BookingDAO;
import models.Booking;
import java.io.IOException;
import java.util.Date;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
/**
 *
 * @author Moham
 */





@WebServlet("/bookingCRUD")
public class BookingCRUDServlet extends HttpServlet {
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
        String action = request.getParameter("action");
        if(action == null) {
            action = "list";
        }
        switch(action) {
            case "list" -> listBookings(request, response);
            case "edit" -> showEditForm(request, response);
            case "delete" -> deleteBooking(request, response);
            default -> listBookings(request, response);
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
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        String action = request.getParameter("action");
        if(action == null) {
            action = "add";
        }
        switch(action) {
            case "add" -> addBooking(request, response);
            case "update" -> updateBooking(request, response);
            default -> addBooking(request, response);
        }
    }
    
    private void listBookings(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Booking> bookings = bookingDAO.getAllBookings();
        request.setAttribute("bookings", bookings);
        request.getRequestDispatcher("manageBookings.jsp").forward(request, response);
    }
    
    private void addBooking(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int userId = Integer.parseInt(request.getParameter("userId"));
        String destination = request.getParameter("destination");
        double baseFare = Double.parseDouble(request.getParameter("baseFare"));
        Booking booking = new Booking();
        booking.setUserId(userId);
        booking.setDestination(destination);
        booking.setBookingDate(new Date());
        booking.setBaseFare(baseFare);
        
        bookingDAO.addBooking(booking);
        response.sendRedirect("bookingCRUD?action=list");
    }
    
    private void showEditForm(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int bookingId = Integer.parseInt(request.getParameter("bookingId"));
        List<Booking> bookings = bookingDAO.getAllBookings();
        Booking booking = null;
        for(Booking b : bookings) {
            if(b.getBookingId() == bookingId) {
                booking = b;
                break;
            }
        }
        request.setAttribute("booking", booking);
        request.getRequestDispatcher("editBooking.jsp").forward(request, response);
    }
    
    private void updateBooking(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int bookingId = Integer.parseInt(request.getParameter("bookingId"));
        String destination = request.getParameter("destination");
        double baseFare = Double.parseDouble(request.getParameter("baseFare"));
        Booking booking = new Booking();
        booking.setBookingId(bookingId);
        booking.setDestination(destination);
        booking.setBookingDate(new Date());
        booking.setBaseFare(baseFare);
        
        bookingDAO.updateBooking(booking);
        response.sendRedirect("bookingCRUD?action=list");
    }
    
    private void deleteBooking(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int bookingId = Integer.parseInt(request.getParameter("bookingId"));
        bookingDAO.deleteBooking(bookingId);
        response.sendRedirect("bookingCRUD?action=list");
    }
}
