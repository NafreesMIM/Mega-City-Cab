/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mega_city_cab.tests;

import Services.NotificationService;
import models.Notification;
import org.junit.Test;
import static org.junit.Assert.*;
import java.util.List;
/**
 *
 * @author Moham
 */


public class NotificationServiceTest {

    @Test
    public void testSendNotification() {
        NotificationService service = new NotificationService();
        service.sendNotification(1, "Trip Assigned", "Driver assigned to your trip");
        List<Notification> notifications = service.getNotificationsForUser(1);
        assertFalse(notifications.isEmpty());
        assertEquals("Trip Assigned", notifications.get(0).getSubject());
    }
}

