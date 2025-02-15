/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

/**
 *
 * @author Moham
 */

package models;

public class Booking {
    private int id;
    private int customerId;
    private String destination;
    private double fare;

    public Booking(int id, int customerId, String destination, double fare) {
        this.id = id;
        this.customerId = customerId;
        this.destination = destination;
        this.fare = fare;
    }
    // Getters and Setters
}