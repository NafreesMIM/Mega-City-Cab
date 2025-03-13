/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mega_city_cab.tests;

import dao.VehicleDAO;
import models.Vehicle;
import org.junit.Test;
import static org.junit.Assert.*;
/**
 *
 * @author Moham
 */


public class VehicleDAOTest {

    @Test
    public void testAddVehicle() {
        VehicleDAO dao = new VehicleDAO();
        Vehicle vehicle = new Vehicle(0, "ABC123", "Toyota Prius", "Toyota", "Available");
        boolean result = dao.addVehicle(vehicle);
        assertTrue(result);
    }
}

