//
//  UserDefaultsConfig.swift
//  eupraxia
//
//  Created by Thomas Guilleminot on 04/04/2020.
//  Copyright © 2020 Thomas Guilleminot. All rights reserved.
//

import Foundation

struct UserDefaultsConfig {
    @UserDefault("hasEnabledNotifications", defaultValue: false)
    static var hasEnabledNotifications: Bool

    @UserDefault("notificationTriggerTime", defaultValue: Date())
    static var notificationTriggerTime: Date
}
