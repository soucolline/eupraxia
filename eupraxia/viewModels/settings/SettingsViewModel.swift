//
//  SettingsViewModel.swift
//  eupraxia
//
//  Created by Thomas Guilleminot on 04/04/2020.
//  Copyright © 2020 Thomas Guilleminot. All rights reserved.
//

import Foundation

final class SettingsViewModel: ObservableObject {

    @Published var shouldShowDidDeleteSuccessAlert = false

    private let notificationManager: NotificationsManager
    private let surveysRepository: SurveysRepository

    init(with notificationManager: NotificationsManager, surveysRepository: SurveysRepository) {
        self.notificationManager = notificationManager
        self.surveysRepository = surveysRepository
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

    func deleteAllData() {
        self.surveysRepository.deleteAllSurveys {
            self.shouldShowDidDeleteSuccessAlert = true
        }
    }

}
