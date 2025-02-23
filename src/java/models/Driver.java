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
    private int driverId;
    private String name;
    private String licenseNumber;
    private String contact;

    public Driver() {}

    public Driver(int driverId, String name, String licenseNumber, String contact) {
        this.driverId = driverId;
        this.name = name;
        this.licenseNumber = licenseNumber;
        this.contact = contact;
    }

    // Getters and setters
    public int getDriverId() { return driverId; }
    public void setDriverId(int driverId) { this.driverId = driverId; }
    public String getName() { return name; }
    public void setName(String name) { this.name = name; }
    public String getLicenseNumber() { return licenseNumber; }
    public void setLicenseNumber(String licenseNumber) { this.licenseNumber = licenseNumber; }
    public String getContact() { return contact; }
    public void setContact(String contact) { this.contact = contact; }
}
