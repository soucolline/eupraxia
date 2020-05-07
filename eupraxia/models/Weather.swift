//
//  Weather.swift
//  eupraxia
//
//  Created by Thomas Guilleminot on 02/04/2020.
//  Copyright © 2020 Thomas Guilleminot. All rights reserved.
//

import Foundation

enum Weather: Int16, CaseIterable, ChoiceRepresentable, Codable {
    case sunny = 0
    case cloudy
    case rainy
    case snowy

    var label: String {
        switch self {
        case .sunny: return "Sunny"
        case .cloudy: return "Cloudy"
        case .rainy: return "Rainy"
        case .snowy: return "Snowy"
        }
    }
}
