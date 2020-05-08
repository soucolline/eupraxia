//
//  SecretsHandler.swift
//  eupraxia
//
//  Created by Thomas Guilleminot on 08/05/2020.
//  Copyright © 2020 Thomas Guilleminot. All rights reserved.
//

import Foundation
import Valet

final class SecretsHandler {

    private let valet = Valet.valet(with: Identifier(nonEmpty: "eupraxia")!, accessibility: .whenUnlockedThisDeviceOnly)

    func getPrivateKey() -> String {
        let key = self.valet.string(forKey: Const.key)

        if key == nil {
            let newKey = String.randomString(length: 32)
            self.valet.set(string: newKey, forKey: Const.key)

            return newKey
        }

        return key!
    }

    func getIVKey() -> String {
        self.valet.string(forKey: Const.iv)!
    }

    func generateNewIVKey() {
        let newIVKey = String.randomString(length: 16)
        self.valet.set(string: newIVKey, forKey: Const.iv)
    }

    private struct Const {
        static let key = "key_key"
        static let iv = "iv_key"
    }

}
