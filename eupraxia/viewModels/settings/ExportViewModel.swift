//
//  ExportViewModel.swift
//  eupraxia
//
//  Created by Thomas Guilleminot on 07/05/2020.
//  Copyright © 2020 Thomas Guilleminot. All rights reserved.
//

import Foundation

final class ExportViewModel: ObservableObject {

    @Published var exportedData = "Exporting data ..."

    private let surveysRepository: SurveysRepository

    init(with surveysRepository: SurveysRepository) {
        self.surveysRepository = surveysRepository

        self.exportedData = self.exportDataFromRepository()
    }

    func exportDataFromRepository() -> String {
        let surveys = self.surveysRepository.getSurveys()
        let surveysJSON = try? JSONEncoder().encode(surveys)

        guard let data = surveysJSON else {
            return "An error occured please try again"
        }

        guard let stringSurveys = String(data: data, encoding: .utf8) else {
            return "An error occured"
        }

        return stringSurveys
    }
}
