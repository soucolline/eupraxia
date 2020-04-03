//
//  HistoryRowViewModel.swift
//  eupraxia
//
//  Created by Thomas Guilleminot on 03/04/2020.
//  Copyright © 2020 Thomas Guilleminot. All rights reserved.
//

import Foundation

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

    func getFeeling() -> String {
        Feeling(rawValue: self.survey.feeling)?.label ?? ""
    }

    func getWeather() -> String {
        Weather(rawValue: self.survey.weather)?.label ?? ""
    }

    func getWork() -> String {
        Work(rawValue: self.survey.work)?.label ?? ""
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
