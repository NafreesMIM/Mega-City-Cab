/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mega_city_cab.tests;

import Services.BookingService;
import models.Booking;
import org.junit.Test;
import static org.junit.Assert.*;
import java.util.Date;
/**
 *
 * @author Moham
 */

public class BookingServiceTest {

    @Test
    public void testCalculateTotalFare() {
        BookingService service = new BookingService();
        Booking booking = new Booking(1, 1, "Airport", new Date(), 100.0, 2);
        double totalFare = service.calculateTotalFare(booking);
        assertEquals(105.0, totalFare, 0.001);
    }
}

