//
//  Notifications.swift
//  Notifications
//
//  Created by Олег Филатов on 16.02.2021.
//  Copyright © 2021 Alexey Efimov. All rights reserved.
//

import UIKit
import UserNotifications


class Notifications: NSObject, UNUserNotificationCenterDelegate {
    
    let notificationCenter = UNUserNotificationCenter.current()
    
    func requestAutorization() {
        notificationCenter.requestAuthorization(options: [.alert, .sound, .badge]) { (granted, error) in
            print("Permission granted: \(granted)")
            guard granted else { return }
            self.getNotificationSettings()
            
        }
    }
    
    func getNotificationSettings() {
        notificationCenter.getNotificationSettings { (settings) in
            print("Notification settings: \(settings)")
        }
    }
    
    func scheduleNotification(notificationType: String) {
        
        let content = UNMutableNotificationContent()
        let userAction = "User Action"
        
        
        content.title = notificationType
        //        content.body = "Если с Вами не связался Администратор, позвоните в заведение!" + notificationType
        content.body = "Если с Вами не связался Администратор, просьба - позвонить и разбутить его."
        content.sound = UNNotificationSound.default
        content.badge = 1
        content.categoryIdentifier = userAction // чтобы появились действия при свайпе на уведомления
        
        //        guard let path = Bundle.main.path(forResource: "car3", ofType: "jpg") else { return }
        //        let url = URL(fileURLWithPath: path)
        //
        //        do {
        //            let attachment = try UNNotificationAttachment(identifier: "car3", url: url, options: nil)
        //            content.attachments = [attachment]
        //        } catch  {
        //            print("The attachment could not be loaded ")
        //        }
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 7, repeats: false)
        let identifier = "Local Notification"
        let request = UNNotificationRequest(identifier: identifier, content: content, trigger: trigger)
        
        notificationCenter.add(request) { (error) in
            if let error = error {
                print("Error \(error.localizedDescription)")
            }
        }
        
        let snoozeAction = UNNotificationAction(identifier: "Snooze", title: "Позвонить", options: [])
        let deleteAction = UNNotificationAction(identifier: "Delete", title: "Удалить", options: [.destructive])
        let category = UNNotificationCategory(identifier: userAction, actions: [snoozeAction, deleteAction], intentIdentifiers: [], options: [])
        
        notificationCenter.setNotificationCategories([category])
        
    }
    
    //чтобы уведомление приходило, когда приложение открыто
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.alert, .sound])
    }
    
    // при нажатии на уведомление открывается приложение и срабаывает блок if response...
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        if response.notification.request.identifier == "Local Notification" {
            print("Handling notification with the Local Notification Identifier")
        }
        
        switch response.actionIdentifier {
        case UNNotificationDismissActionIdentifier: // пользователь явно отклоняет уведомление, например из центра уведомлений
            print("Dismiss Action")
            
        case UNNotificationDefaultActionIdentifier:
            print("Default")
            
        case "Snooze":
            print("Snooze")
            guard let number1 = URL(string: "tel://" + "+74957064148")  else { return }
            UIApplication.shared.open(number1)
        //  scheduleNotification(notificationType: "Reminder")
        case "Delete":
            print("Delete")
        default:
            print("Unknown action")
        }
        
        completionHandler()
    }
}
