//
//  SurveyViewModel.swift
//  eupraxia
//
//  Created by Thomas Guilleminot on 02/04/2020.
//  Copyright © 2020 Thomas Guilleminot. All rights reserved.
//

import Foundation
import Combine

final class SurveyViewModel: ObservableObject {

    let feelings = Feelings.allCases
    let weather = Weather.allCases
    let work = Work.allCases

    @Published var selectedFeeling = -1
    @Published var selectedWeather = -1
    @Published var selectedWork = -1

    @Published var didEatBreakfast = false
    @Published var didEatDinner = false
    @Published var didEatLunch = false
    @Published var didHaveSex = false

    @Published var breakfastFood = ""
    @Published var lunchFood = ""
    @Published var dinnerFood = ""

    func generateSurvey() -> Survey {
        Survey(
            feeling: self.feelings[self.selectedFeeling],
            weather: self.weather[self.selectedWeather],
            work: self.work[self.selectedWork],
            hadSex: self.didHaveSex,
            breakfast: self.breakfastFood.nilIfEmpty(),
            lunch: self.lunchFood.nilIfEmpty(),
            dinner: self.dinnerFood.nilIfEmpty()
        )
    }
    
}
