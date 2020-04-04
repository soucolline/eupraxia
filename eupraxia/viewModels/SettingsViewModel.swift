//
//  SettingsViewModel.swift
//  eupraxia
//
//  Created by Thomas Guilleminot on 04/04/2020.
//  Copyright © 2020 Thomas Guilleminot. All rights reserved.
//

import Foundation

final class SettingsViewModel: ObservableObject {

    private let notificationManager: NotificationsManager

    init(with notificationManager: NotificationsManager) {
        self.notificationManager = notificationManager
    }

    @Published var hasEnabledNotifications: Bool = UserDefaultsConfig.hasEnabledNotifications {
        willSet(newValue) {
            UserDefaultsConfig.hasEnabledNotifications = newValue

            if newValue == true {
                self.notificationManager.requestNotificationAuthorization()
                self.notificationManager.setReminderNotification(to: self.notificationTriggerTime)
            }
        }
    }

    @Published var notificationTriggerTime: Date = UserDefaultsConfig.notificationTriggerTime {
        willSet(newValue) {
            UserDefaultsConfig.notificationTriggerTime = newValue
            self.notificationManager.setReminderNotification(to: newValue)
        }
    }

}
