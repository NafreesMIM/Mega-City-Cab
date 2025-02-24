/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package models;

/**
 *
 * @author Moham
 */


public class Driver {
    private int driverId;
    private int userId;      // links to the corresponding user record
    private String name;
    private String licenseNumber;
    private String contact;
    private boolean available;

    public Driver() {}

    public Driver(int driverId, int userId, String name, String licenseNumber, String contact, boolean available) {
        this.driverId = driverId;
        this.userId = userId;
        this.name = name;
        this.licenseNumber = licenseNumber;
        this.contact = contact;
        this.available = available;
    }

    // Getters and setters
    public int getDriverId() { return driverId; }
    public void setDriverId(int driverId) { this.driverId = driverId; }
    
    public int getUserId() { return userId; }
    public void setUserId(int userId) { this.userId = userId; }
    
    public String getName() { return name; }
    public void setName(String name) { this.name = name; }
    
    public String getLicenseNumber() { return licenseNumber; }
    public void setLicenseNumber(String licenseNumber) { this.licenseNumber = licenseNumber; }
    
    public String getContact() { return contact; }
    public void setContact(String contact) { this.contact = contact; }
    
    public boolean isAvailable() { return available; }
    public void setAvailable(boolean available) { this.available = available; }
}
