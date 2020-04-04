//
//  SettingsViewModel.swift
//  eupraxia
//
//  Created by Thomas Guilleminot on 04/04/2020.
//  Copyright © 2020 Thomas Guilleminot. All rights reserved.
//

import Foundation

final class SettingsViewModel: ObservableObject {

    @Published var hasEnabledNotifications: Bool = UserDefaultsConfig.hasEnabledNotifications {
        willSet(newValue) {
            UserDefaultsConfig.hasEnabledNotifications = newValue
        }
    }

    @Published var notificationTriggerTime: Date = UserDefaultsConfig.notificationTriggerTime {
        willSet(newValue) {
            UserDefaultsConfig.notificationTriggerTime = newValue
        }
    }

}
