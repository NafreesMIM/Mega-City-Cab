/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */


/**
 *
 * @author Moham
 */
package models;

public class Driver {
    private int id;
    private String name;
    private String licenseNumber;
    private boolean available;

    public Driver(int id, String name, String licenseNumber, boolean available) {
        this.id = id;
        this.name = name;
        this.licenseNumber = licenseNumber;
        this.available = available;
    }
    // Getters and Setters
}
