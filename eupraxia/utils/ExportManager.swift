//
//  ExportManager.swift
//  eupraxia
//
//  Created by Thomas Guilleminot on 07/05/2020.
//  Copyright © 2020 Thomas Guilleminot. All rights reserved.
//

import Foundation

final class ExportManager {

    private let encryptor = DataEncryptor()

    func exportSurveysToString(surveys: [Survey]) -> String {
        let surveysJSON = try? JSONEncoder().encode(surveys)

        guard let data = surveysJSON else {
            return "An error occured, please try again"
        }

        guard let stringSurveys = String(data: data, encoding: .utf8) else {
            return "An error occured, please try again"
        }

        return self.encryptor.encrypt(data: stringSurveys)
    }

}
