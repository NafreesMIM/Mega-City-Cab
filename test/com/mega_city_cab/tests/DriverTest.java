/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mega_city_cab.tests;

import models.Driver;
import org.junit.Test;
import static org.junit.Assert.*;
/**
 *
 * @author Moham
 */


public class DriverTest {

    @Test
    public void testDriverObjectCreation() {
        Driver driver = new Driver(1, 1, "John Doe", "DL12345", "9876543210", true);
        assertEquals("John Doe", driver.getName());
    }
}

