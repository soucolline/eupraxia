//
//  DetailsViewModel.swift
//  eupraxia
//
//  Created by Thomas Guilleminot on 04/04/2020.
//  Copyright © 2020 Thomas Guilleminot. All rights reserved.
//

import Foundation

final class DetailsViewModel: ObservableObject {

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

    func getFeeling() -> String {
        Feeling(rawValue: self.survey.feeling)?.label ?? ""
    }

    func getWeather() -> String {
        Weather(rawValue: self.survey.weather)?.label ?? ""
    }

    func getWork() -> String {
        Work(rawValue: self.survey.work)?.label ?? ""
    }

    func getBreakFast() -> String {
        survey.breakfast ?? "Nothing"
    }

    func getLunch() -> String {
        survey.lunch ?? "Nothing"
    }

    func getDinner() -> String {
        survey.dinner ?? "Nothing"
    }

    func getDidHaveSex() -> String {
        self.survey.hadSex ? "Yes" : "No"
    }

    func getDidHaveStomachAche() -> String {
        self.survey.hadStomachAche ? "Yes" : "No"
    }
}