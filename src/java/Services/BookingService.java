/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Services;

import models.Booking;
/**
 *
 * @author Moham
 */


public class BookingService {
    // Example: method to calculate fare or perform additional business rules.
    public double calculateTotalFare(Booking booking) {
        double tax = 0.10 * booking.getBaseFare();
        double discount = 0.05 * booking.getBaseFare();
        return booking.getBaseFare() + tax - discount;
    }
}

