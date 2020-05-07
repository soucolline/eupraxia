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
    private let exportManager = ExportManager()

    init(with surveysRepository: SurveysRepository) {
        self.surveysRepository = surveysRepository
    }

    func exportData() {
        let surveys = self.surveysRepository.getSurveys()
        self.exportedData = self.exportManager.exportSurveysToString(surveys: surveys)
    }
}
