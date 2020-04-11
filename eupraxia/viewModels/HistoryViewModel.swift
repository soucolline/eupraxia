//
//  HistoryViewModel.swift
//  eupraxia
//
//  Created by Thomas Guilleminot on 09/04/2020.
//  Copyright © 2020 Thomas Guilleminot. All rights reserved.
//

import Foundation

final class HistoryViewModel: ObservableObject {

    @Published var surveys: [Survey] = []

    private let surveysRepository: SurveysRepository

    init(with surveysRepository: SurveysRepository) {
        self.surveysRepository = surveysRepository

        self.getSurveys()
    }

    func getSurveys() {
        self.surveys = self.surveysRepository.getSurveys()
    }

    func getSubtitle() -> String {
        let numberOfDays = self.getConsecutiveDaysOfNoPain()

        if numberOfDays == 0 {
            return "You had a stomach pain yesterday 😭"
        } else {
            return "You had no stomach pains for \(numberOfDays) day\(numberOfDays > 1 ? "s" : "") straight."
        }

    }

    private func getConsecutiveDaysOfNoPain() -> Int {
        var numberOfDaysWithoutPain = 0

        for survey in surveys {
            if survey.hadStomachAche {
                break
            }

            numberOfDaysWithoutPain += 1
        }

        return numberOfDaysWithoutPain
    }
}
