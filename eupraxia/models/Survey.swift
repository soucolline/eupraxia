//
//  Survey.swift
//  eupraxia
//
//  Created by Thomas Guilleminot on 07/04/2020.
//  Copyright © 2020 Thomas Guilleminot. All rights reserved.
//

import Foundation

struct Survey: Codable {
    let id: UUID
    let date: Date
    let feeling: Feeling
    let breakfast: String?
    let lunch: String?
    let dinner: String?
    let hadSex: Bool
    let hadStomachAche: Bool
    let weather: Weather
    let work: Work
    let extraNotes: String?
}
