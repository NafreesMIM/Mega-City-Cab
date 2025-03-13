/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mega_city_cab.tests;

import models.User;
import org.junit.Test;
import static org.junit.Assert.*;
/**
 *
 * @author Moham
 */


public class UserTest {

    @Test
    public void testUserObjectCreation() {
        User user = new User(1, "johndoe", "password", "John Doe", "123 Street", "1234567890", "123456789V", "Customer");
        assertEquals("johndoe", user.getUsername());
    }
}

