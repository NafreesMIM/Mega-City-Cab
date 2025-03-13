/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mega_city_cab.tests;

import dao.BookingDAO;
import models.Booking;
import org.junit.Test;
import static org.junit.Assert.*;
import java.util.Date;
/**
 *
 * @author Moham
 */


public class BookingDAOTest {

    @Test
    public void testAddBooking() {
        BookingDAO dao = new BookingDAO();
        Booking booking = new Booking(0, 1, "Airport", new Date(), 100.0, 2);
        boolean result = dao.addBooking(booking);
        assertTrue(result);
    }
}
