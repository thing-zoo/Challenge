//
//  Notification.swift
//  Challenge
//
//  Created by thingzoo on 2021/06/12.
//

import Foundation
import UserNotifications

struct Note {
    var id: String
    var title: String
}

class LocalNotificationManager {
    var notifications = [Note]()
    
    func requestPermission() -> Void {
        UNUserNotificationCenter
            .current()
            .requestAuthorization(options: [.alert, .badge, .alert]) { granted, error in
                if granted == true && error == nil {
                    // We have permission!
                }
        }
    }
    
    func addNotification(title: String, hour: Int, minute: Int) -> Void {
        let note = Note(id: UUID().uuidString, title: title)
        let content = UNMutableNotificationContent()
        content.title = note.title

        var date = DateComponents()
        date.hour = hour
        date.minute = minute
        let trigger = UNCalendarNotificationTrigger(dateMatching: date, repeats: true)
        let request = UNNotificationRequest(identifier: note.id, content: content, trigger: trigger)

        UNUserNotificationCenter.current().add(request) { error in
            guard error == nil else { return }
            print("Scheduling notification with id: \(note.id)")
        }
        notifications.append(note)
    }

//
//    func addNotification(title: String) -> Void {
//            notifications.append(Note(id: UUID().uuidString, title: title))
//    }
//
//    func scheduleNotifications(hour: Int, minute: Int) -> Void {
//        for notification in notifications {
//            let content = UNMutableNotificationContent()
//            content.title = notification.title
//
//            var date = DateComponents()
//            date.hour = hour
//            date.minute = minute
//            let trigger = UNCalendarNotificationTrigger(dateMatching: date, repeats: true)
//            let request = UNNotificationRequest(identifier: notification.id, content: content, trigger: trigger)
//
//            UNUserNotificationCenter.current().add(request) { error in
//                guard error == nil else { return }
//                print("Scheduling notification with id: \(notification.id)")
//            }
//        }
//    }
}
