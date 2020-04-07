//
//  SurveysRepository.swift
//  eupraxia
//
//  Created by Thomas Guilleminot on 07/04/2020.
//  Copyright © 2020 Thomas Guilleminot. All rights reserved.
//

import Foundation

protocol SurveysRepository {
    func getSurveys() -> [Survey]
    func save(survey: Survey)
    func update(survey: Survey)
    func delete(survey: Survey)
}
