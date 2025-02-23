/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */


/**
 *
 * @author Moham
 */
package models;

public class Car {
    private int id;
    private String model;
    private String plateNumber;
    private boolean available;

    public Car(int id, String model, String plateNumber, boolean available) {
        this.id = id;
        this.model = model;
        this.plateNumber = plateNumber;
        this.available = available;
    }
    // Getters and Setters
}
