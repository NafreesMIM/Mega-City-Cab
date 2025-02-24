/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Services;

import models.Notification;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.List;
/**
 *
 * @author Moham
 */


public class NotificationService implements INotificationService {
    private static List<Notification> notifications = Collections.synchronizedList(new ArrayList<>());
    private static int nextId = 1;

    @Override
    public void sendNotification(int userId, String subject, String message) {
        Notification notification = new Notification(nextId++, userId, subject, message, new Date());
        notifications.add(notification);
        System.out.println("Notification sent to userId " + userId + ": " + subject + " - " + message);
    }

    @Override
    public List<Notification> getNotificationsForUser(int userId) {
        List<Notification> userNotifications = new ArrayList<>();
        synchronized(notifications) {
            for (Notification n : notifications) {
                if(n.getUserId() == userId) {
                    userNotifications.add(n);
                }
            }
        }
        return userNotifications;
    }
}


