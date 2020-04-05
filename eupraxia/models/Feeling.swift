//
//  Feelings.swift
//  eupraxia
//
//  Created by Thomas Guilleminot on 02/04/2020.
//  Copyright © 2020 Thomas Guilleminot. All rights reserved.
//

import Foundation

enum Feeling: Int16, CaseIterable {
    case veryBad = 0
    case bad
    case average
    case good

    var label: String {
        switch self {
        case .veryBad: return "Very bad"
        case .bad: return "Bad"
        case .average: return "Average"
        case .good: return "Good"
        }
    }
}
