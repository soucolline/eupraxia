//
//  HistoryRowViewModel.swift
//  eupraxia
//
//  Created by Thomas Guilleminot on 03/04/2020.
//  Copyright © 2020 Thomas Guilleminot. All rights reserved.
//

import Foundation
import SwiftUI

final class HistoryRowViewModel: ObservableObject {

    private let survey: Survey

    lazy var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE, MMM d, yyyy"
        return formatter
    }()

    init(with survey: Survey) {
        self.survey = survey
    }

    func getDate() -> String {
        self.dateFormatter.string(from: self.survey.date)
    }

    func didHaveStomachAche() -> Bool {
        self.survey.hadStomachAche
    }

    func getFeelingIcon() -> String {
        switch self.survey.feeling {
        case .veryBad: return K.Icons.moodVeryBad
        case .bad: return K.Icons.moodBad
        case .average: return K.Icons.moodAverage
        case .good: return K.Icons.moodGood
        }
    }

    func getWeatherIcon() -> String {
        switch self.survey.weather {
        case .sunny: return K.Icons.weatherSunny
        case .cloudy: return K.Icons.weatherCloudy
        case .rainy: return K.Icons.weatherRainy
        case .snowy: return K.Icons.weatherSnowy
        }
    }

    func getWorkIcon() -> String {
        switch self.survey.work {
        case .bad: return K.Icons.workBad
        case .average: return K.Icons.workAverage
        case .good: return K.Icons.workGood
        case .didNotWork: return K.Icons.workDisabled
        }
    }

    func didEatBreakfast() -> Bool {
        !self.survey.breakfast.isEmptyOrNil()
    }

    func didEatLunch() -> Bool {
        !self.survey.lunch.isEmptyOrNil()
    }

    func didEatDinner() -> Bool {
        !self.survey.dinner.isEmptyOrNil()
    }

    func didHaveSex() -> Bool {
        self.survey.hadSex
    }
}
