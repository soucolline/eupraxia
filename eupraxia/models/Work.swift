//
//  Work.swift
//  eupraxia
//
//  Created by Thomas Guilleminot on 02/04/2020.
//  Copyright © 2020 Thomas Guilleminot. All rights reserved.
//

import Foundation

enum Work: Int16, CaseIterable, ChoiceRepresentable {
    case bad = 0
    case average
    case good
    case didNotWork

    var label: String {
        switch self {
        case .bad: return "Bad"
        case .average: return "Average"
        case .good: return "Good"
        case .didNotWork: return "Did not work"
        }
    }
}
