//
//  Survey+CoreDataClass.swift
//  
//
//  Created by Thomas Guilleminot on 03/04/2020.
//
//  This file was automatically generated and should not be edited.
//

import Foundation
import CoreData

@objc(ManagedSurvey)
public class ManagedSurvey: NSManagedObject {
    @nonobjc public class func fetchRequest() -> NSFetchRequest<ManagedSurvey> {
        return NSFetchRequest<ManagedSurvey>(entityName: "Survey")
    }

    @NSManaged public var id: UUID
    @NSManaged public var date: Date
    @NSManaged public var feeling: Int16
    @NSManaged public var breakfast: String?
    @NSManaged public var lunch: String?
    @NSManaged public var dinner: String?
    @NSManaged public var hadSex: Bool
    @NSManaged public var hadStomachAche: Bool
    @NSManaged public var weather: Int16
    @NSManaged public var work: Int16

    init(
        date: Date,
        feeling: Feeling,
        weather: Weather,
        work: Work,
        hadSex: Bool,
        hadStomachAche: Bool,
        breakfast: String?,
        lunch: String?,
        dinner: String?,
        in context: NSManagedObjectContext
    ) {
        super.init(entity: Self.entity(), insertInto: context)
        self.id = UUID()
        self.date = date
        self.feeling = feeling.rawValue
        self.weather = weather.rawValue
        self.work = work.rawValue
        self.hadSex = hadSex
        self.hadStomachAche = hadStomachAche
        self.breakfast = breakfast
        self.lunch = lunch
        self.dinner = dinner
    }

    public override init(entity: NSEntityDescription, insertInto context: NSManagedObjectContext?) {
        super.init(entity: entity, insertInto: context)
    }
}

extension ManagedSurvey {
    func toSurvey() -> Survey {
        Survey(
            id: id,
            date: date,
            feeling: Feeling(rawValue: feeling)!,
            breakfast: breakfast,
            lunch: lunch,
            dinner: dinner,
            hadSex: hadSex,
            hadStomachAche: hadStomachAche,
            weather: Weather(rawValue: weather)!,
            work: Work(rawValue: work)!
        )
    }
}

extension ManagedSurvey {
    static func createTestSurvey(from context: NSManagedObjectContext) -> ManagedSurvey {
        let survey = ManagedSurvey(context: context)
        survey.id = UUID()
        survey.date = Date()
        survey.feeling = 1
        survey.weather = 1
        survey.work = 1
        survey.lunch = "My lunch"
        survey.hadStomachAche = false

        return survey
    }
}