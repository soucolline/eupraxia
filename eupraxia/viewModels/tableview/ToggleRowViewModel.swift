//
//  ToggleRowViewModel.swift
//  eupraxia
//
//  Created by Thomas Guilleminot on 09/04/2020.
//  Copyright © 2020 Thomas Guilleminot. All rights reserved.
//

import Foundation

final class ToggleRowViewModel: ObservableObject {

    var text: String
    var details: String?
    var value: Bool

    @Published var isToggleOn: Bool = false

    init(text: String, details: String?, value: Bool) {
        self.text = text
        self.details = details
        self.value = value
        self.isToggleOn = value
    }

}
