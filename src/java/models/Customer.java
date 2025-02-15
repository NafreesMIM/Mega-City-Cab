/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package models;

/**
 *
 * @author Moham
 */

public class Customer {
    private int id;
    private String name;
    private String nic;
    private String address;
    private String phone;
    private String email;
    private String password;

    public Customer(int id, String name, String nic, String address, String phone, String email, String password) {
        this.id = id;
        this.name = name;
        this.nic = nic;
        this.address = address;
        this.phone = phone;
        this.email = email;
        this.password = password;
    }
    
    // Getters and Setters
}
