//
//  ImportManager.swift
//  eupraxia
//
//  Created by Thomas Guilleminot on 07/05/2020.
//  Copyright © 2020 Thomas Guilleminot. All rights reserved.
//

import Foundation

final class ImportManager {

    private let surveysRepository: SurveysRepository
    private let decryptor = DataDecryptor()

    init(with surveysRepository: SurveysRepository) {
        self.surveysRepository = surveysRepository
    }

    func importDataFromString(data: String, completion: @escaping (Bool) -> Void) {
        guard let decryptedData = try? self.decryptor.decrypt(data: data) else {
            completion(false)
            return
        }

        guard let data = decryptedData.data(using: .utf8) else {
            completion(false)
            return
        }

        guard let surveys = try? JSONDecoder().decode([Survey].self, from: data) else {
            completion(false)
            return
        }

        self.surveysRepository.deleteAllSurveys {
            surveys.forEach {
                self.surveysRepository.save(survey: $0)
            }

            completion(true)
        }
    }

}
