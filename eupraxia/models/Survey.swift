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

@objc(Survey)
public class Survey: NSManagedObject {
    @nonobjc public class func fetchRequest() -> NSFetchRequest<Survey> {
        return NSFetchRequest<Survey>(entityName: "Survey")
    }

    @NSManaged public var id: UUID
    @NSManaged public var breakfast: String?
    @NSManaged public var dinner: String?
    @NSManaged public var feeling: Int16
    @NSManaged public var hadSex: Bool
    @NSManaged public var lunch: String?
    @NSManaged public var weather: Int16
    @NSManaged public var work: Int16

    init(
        feeling: Feeling,
        weather: Weather,
        work: Work,
        hadSex: Bool,
        breakfast: String?,
        lunch: String?,
        dinner: String?,
        in context: NSManagedObjectContext
    ) {
        super.init(entity: Self.entity(), insertInto: context)
        self.id = UUID()
        self.feeling = feeling.rawValue
        self.weather = weather.rawValue
        self.work = work.rawValue
        self.hadSex = hadSex
        self.breakfast = breakfast
        self.lunch = lunch
        self.dinner = dinner
    }

    public override init(entity: NSEntityDescription, insertInto context: NSManagedObjectContext?) {
        super.init(entity: entity, insertInto: context)
    }
}
