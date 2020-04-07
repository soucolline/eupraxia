//
//  Constants.swift
//  eupraxia
//
//  Created by Thomas Guilleminot on 05/04/2020.
//  Copyright © 2020 Thomas Guilleminot. All rights reserved.
//

import Foundation
import SwiftUI

struct K {
    struct Font {
        static let openSansRegular = "OpenSans-Regular"
        static let openSansSemiBold = "OpenSans-SemiBold"
        static let openSansBold = "OpenSans-Bold"
    }

    struct Icons {
        static let done = "ic_done"
        static let error = "ic_error"
        static let moodAverage = "ic_mood_average"
        static let moodBad = "ic_mood_bad"
        static let moodGood = "ic_mood_good"
        static let moodVeryBad = "ic_mood_very_bad"
        static let weatherSunny = "ic_weather_sunny"
        static let weatherCloudy = "ic_weather_cloudy"
        static let weatherRainy = "ic_weather_rainy"
        static let weatherSnowy = "ic_weather_snowy"
        static let workBad = "ic_work_bad"
        static let workAverage = "ic_work_average"
        static let workGood = "ic_work_good"
        static let workDisabled = "ic_work_disabled"

    }
}

extension Color {
    static let background = Color("background")
    static let border = Color("border")
    static let buttonBlue = Color("buttonBlue")
    static let buttonGreen = Color("buttonGreen")
    static let buttonGrey = Color("buttonGrey")
    static let buttonSalmon = Color("buttonSalmon")
    static let buttonYellow = Color("buttonYellow")
    static let darkPink = Color("darkPink")
    static let lightPink = Color("lightPink")
    static let text = Color("text")
}
