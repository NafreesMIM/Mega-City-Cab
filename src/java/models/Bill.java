/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package models;

/**
 *
 * @author Moham
 */



public class Bill {
    private int bookingId;
    private double baseFare;
    private double tax;
    private double discount;
    private double total;

    public Bill() {}

    public Bill(int bookingId, double baseFare, double tax, double discount) {
        this.bookingId = bookingId;
        this.baseFare = baseFare;
        this.tax = tax;
        this.discount = discount;
        calculateTotal();
    }

    public void calculateTotal() {
        total = baseFare + tax - discount;
    }

    // Getters and setters
    public int getBookingId() { return bookingId; }
    public void setBookingId(int bookingId) { this.bookingId = bookingId; }
    
    public double getBaseFare() { return baseFare; }
    public void setBaseFare(double baseFare) { this.baseFare = baseFare; }
    
    public double getTax() { return tax; }
    public void setTax(double tax) { this.tax = tax; }
    
    public double getDiscount() { return discount; }
    public void setDiscount(double discount) { this.discount = discount; }
    
    public double getTotal() { return total; }
}
