/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package models;

import java.util.Date;
/**
 *
 * @author Moham
 */


public class Booking {
    private int bookingId;
    private int userId;
    private String destination;
    private Date bookingDate;
    private double baseFare;
    // Use 0 to denote that no driver is assigned
    private int driverId; 

    public Booking() {}

    public Booking(int bookingId, int userId, String destination, Date bookingDate, double baseFare, int driverId) {
        this.bookingId = bookingId;
        this.userId = userId;
        this.destination = destination;
        this.bookingDate = bookingDate;
        this.baseFare = baseFare;
        this.driverId = driverId;
    }

    // Getters and setters
    public int getBookingId() {
        return bookingId;
    }
    public void setBookingId(int bookingId) {
        this.bookingId = bookingId;
    }
    public int getUserId() {
        return userId;
    }
    public void setUserId(int userId) {
        this.userId = userId;
    }
    public String getDestination() {
        return destination;
    }
    public void setDestination(String destination) {
        this.destination = destination;
    }
    public Date getBookingDate() {
        return bookingDate;
    }
    public void setBookingDate(Date bookingDate) {
        this.bookingDate = bookingDate;
    }
    public double getBaseFare() {
        return baseFare;
    }
    public void setBaseFare(double baseFare) {
        this.baseFare = baseFare;
    }
    public int getDriverId() {
        return driverId;
    }
    public void setDriverId(int driverId) {
        this.driverId = driverId;
    }
}
