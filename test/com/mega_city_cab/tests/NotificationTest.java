/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mega_city_cab.tests;

import models.Notification;
import org.junit.Test;
import static org.junit.Assert.*;
import java.util.Date;
/**
 *
 * @author Moham
 */

public class NotificationTest {

    @Test
    public void testNotificationCreation() {
        Notification notification = new Notification(1, 1, "Trip Assigned", "Driver assigned to your trip", new Date());
        assertNotNull(notification);
        assertEquals("Trip Assigned", notification.getSubject());
    }
}

