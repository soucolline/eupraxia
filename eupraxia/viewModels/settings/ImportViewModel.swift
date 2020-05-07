//
//  ImportViewModel.swift
//  eupraxia
//
//  Created by Thomas Guilleminot on 07/05/2020.
//  Copyright © 2020 Thomas Guilleminot. All rights reserved.
//

import Foundation
import SwiftUI

final class ImportViewModel: ObservableObject {

    @Published var importButtonTitle = "Import"

    private let importManager: ImportManager

    init(with importManager: ImportManager) {
        self.importManager = importManager
    }

    func importData(from value: String) {
        self.importManager.importDataFromString(data: value) { didSucceed in
            if didSucceed {
                self.importButtonTitle = "Succeeded"
            } else {
                self.importButtonTitle = "An error occured please try again"
            }
        }
    }

}
