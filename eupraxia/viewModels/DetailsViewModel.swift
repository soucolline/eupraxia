//
//  DetailsViewModel.swift
//  eupraxia
//
//  Created by Thomas Guilleminot on 04/04/2020.
//  Copyright © 2020 Thomas Guilleminot. All rights reserved.
//

import Foundation

final class DetailsViewModel: ObservableObject {

    var survey: Survey

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

    func getFeeling() -> Feeling {
        self.survey.feeling
    }

    func getWeather() -> Weather {
        self.survey.weather
    }

    func getWork() -> Work {
        self.survey.work
    }

    func getBreakFast() -> String? {
        survey.breakfast
    }

    func getLunch() -> String? {
        survey.lunch
    }

    func getDinner() -> String? {
        survey.dinner
    }

    func didHaveSex() -> Bool {
        self.survey.hadSex
    }

    func getDidHaveStomachAche() -> String {
        self.survey.hadStomachAche ? "Yes" : "No"
    }

    func getExtraNotes() -> String? {
        self.survey.extraNotes
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
}
