//
//  NotificationsManager.swift
//  eupraxia
//
//  Created by Thomas Guilleminot on 04/04/2020.
//  Copyright © 2020 Thomas Guilleminot. All rights reserved.
//

import Foundation
import UserNotifications

class NotificationsManager {

    private let notificationCenter: UNUserNotificationCenter

    init(with notificationCenter: UNUserNotificationCenter) {
        self.notificationCenter = notificationCenter
    }

    func requestNotificationAuthorization() {
        self.notificationCenter.requestAuthorization(options: [.alert, .sound, .badge]) { granted, error in
            if !granted {
                print("Authorizations are not granted")
            }
        }
    }

    func setReminderNotification(to date: Date) {
        var dateComponent = DateComponents()
        dateComponent.hour = Calendar.current.component(.hour, from: date)
        dateComponent.minute = Calendar.current.component(.minute, from: date)

        let notificationContent = UNMutableNotificationContent()
        notificationContent.title = "Hello Thomas"
        notificationContent.body = "Don't forget to fill your daily survey 🙏"
        notificationContent.badge = NSNumber(value: 1)
        notificationContent.sound = .default

        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponent, repeats: true)
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: notificationContent, trigger: trigger)

        self.notificationCenter.removeAllPendingNotificationRequests()
        self.notificationCenter.add(request)
    }

}
