//
//  SurveyViewModel.swift
//  eupraxia
//
//  Created by Thomas Guilleminot on 02/04/2020.
//  Copyright © 2020 Thomas Guilleminot. All rights reserved.
//

import Foundation
import Combine
import CoreData

final class SurveyViewModel: ObservableObject {

    private let surveysRepository: SurveysRepository

    let feelings = Feeling.allCases
    let weather = Weather.allCases
    let work = Work.allCases

    @Published var surveyDate = Date()
    @Published var selectedFeeling = -1
    @Published var selectedWeather = -1
    @Published var selectedWork = -1

    @Published var didEatBreakfast = false
    @Published var didEatDinner = false
    @Published var didEatLunch = false
    @Published var didHaveSex = false
    @Published var didHaveStomachAche = false
    @Published var didHaveExtraNotes = false
    @Published var extraNotes = ""

    @Published var breakfastFood = ""
    @Published var lunchFood = ""
    @Published var dinnerFood = ""

    @Published var showSuccessAlert = false

    init(with surveysRepository: SurveysRepository) {
        self.surveysRepository = surveysRepository
    }

    func isValidateButtonDisabled() -> Bool {
        self.selectedFeeling == -1 ||
        self.selectedWeather == -1 ||
        self.selectedWork == -1
    }

    func generateSurvey() {
        let survey = Survey(
            id: UUID(),
            date: self.surveyDate,
            feeling: self.feelings[self.selectedFeeling],
            breakfast: self.breakfastFood.nilIfEmpty(),
            lunch: self.lunchFood.nilIfEmpty(),
            dinner: self.dinnerFood.nilIfEmpty(),
            hadSex: self.didHaveSex,
            hadStomachAche: self.didHaveStomachAche,
            weather: self.weather[self.selectedWeather],
            work: self.work[self.selectedWork],
            extraNotes: self.extraNotes.nilIfEmpty()
        )

        self.surveysRepository.save(survey: survey)

        self.resetSurveyOnSubmit()
    }

    private func resetSurveyOnSubmit() {
        self.surveyDate = Date()
        self.selectedFeeling = -1
        self.selectedWeather = -1
        self.selectedWork = -1
        self.didEatBreakfast = false
        self.didEatDinner = false
        self.didEatLunch = false
        self.didHaveSex = false
        self.didHaveStomachAche = false
        self.didHaveExtraNotes = false
        self.breakfastFood = ""
        self.lunchFood = ""
        self.dinnerFood = ""
        self.extraNotes = ""
    }
    
}
