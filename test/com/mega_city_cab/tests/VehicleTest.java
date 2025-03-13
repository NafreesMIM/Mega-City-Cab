/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mega_city_cab.tests;

import models.Vehicle;
import org.junit.Test;
import static org.junit.Assert.*;
/**
 *
 * @author Moham
 */


public class VehicleTest {

    @Test
    public void testVehicleObjectCreation() {
        Vehicle vehicle = new Vehicle(1, "ABC123", "Toyota Prius", "Toyota", "Available");
        assertEquals("Toyota Prius", vehicle.getModel());
    }
}

