//
//  SurveysRepository.swift
//  eupraxia
//
//  Created by Thomas Guilleminot on 07/04/2020.
//  Copyright © 2020 Thomas Guilleminot. All rights reserved.
//

import Foundation
import CoreData
import Combine

protocol SurveysRepository {
    func getSurveys() -> [Survey]
    func save(survey: Survey)
    func update(survey: Survey)
    func delete(survey: Survey, completion: @escaping () -> Void)
}

class SurveysRepositoryImpl: SurveysRepository {

    private let context: NSManagedObjectContext

    init(with context: NSManagedObjectContext) {
        self.context = context
    }


    func getSurveys() -> [Survey] {
        let request = NSFetchRequest<ManagedSurvey>(entityName: "ManagedSurvey")
        let surveys: [Survey]

        do {
            let managedSurveys = try self.context.fetch(request)
            surveys = managedSurveys.map { $0.toSurvey() }
        } catch {
            fatalError("Could not fetch surveys from coredata")
        }

        return surveys
    }

    func save(survey: Survey) {
        do {
            _ = ManagedSurvey(from: survey, in: self.context)
            try self.context.save()
        } catch {
            fatalError("Could not save survey")
        }
    }

    func update(survey: Survey) {

    }

    func delete(survey: Survey, completion: @escaping () -> Void) {
        let request = NSFetchRequest<ManagedSurvey>(entityName: "ManagedSurvey")
        request.predicate = NSPredicate(format: "id==\(survey.id)")

        do {
            let result = try self.context.fetch(request)

            for survey in result {
                self.context.delete(survey)
            }

            completion()
        } catch {
            fatalError("Could not delete survey")
        }
    }

    private func saveContext() {
        if self.context.hasChanges {
            do {
                try self.context.save()
            } catch {
                fatalError("Could not saveContext")
            }
        }
    }
}
