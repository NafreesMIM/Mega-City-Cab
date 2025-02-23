/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Services;

/**
 *
 * @author Moham
 */

public class NotificationService {
    public void sendNotification(String recipientEmail, String subject, String message) {
        // For demonstration, simply print the notification details.
        System.out.println("Sending notification to: " + recipientEmail);
        System.out.println("Subject: " + subject);
        System.out.println("Message: " + message);
        // In production, integrate JavaMail or an SMS API.
    }
}

