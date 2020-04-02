//
//  UtilsExtensions.swift
//  eupraxia
//
//  Created by Thomas Guilleminot on 02/04/2020.
//  Copyright © 2020 Thomas Guilleminot. All rights reserved.
//

import Foundation

extension String {
    func nilIfEmpty() -> String? {
        self.isEmpty ? nil : self
    }
}
