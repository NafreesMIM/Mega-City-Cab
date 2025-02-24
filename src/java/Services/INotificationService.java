/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Services;

import java.util.List;
import models.Notification;
/**
 *
 * @author Moham
 */

public interface INotificationService {
    void sendNotification(int userId, String subject, String message);
    List<Notification> getNotificationsForUser(int userId);
}

