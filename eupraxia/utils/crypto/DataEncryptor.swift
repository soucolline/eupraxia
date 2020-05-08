//
//  DataEncryptor.swift
//  eupraxia
//
//  Created by Thomas Guilleminot on 08/05/2020.
//  Copyright © 2020 Thomas Guilleminot. All rights reserved.
//

import Foundation
import Valet

final class DataEncryptor {

    private let valet = Valet.valet(with: Identifier(nonEmpty: "eupraxia")!, accessibility: .whenUnlockedThisDeviceOnly)

    func encrypt(data: String) -> String {
        let key = self.getPrivateKey()
        let iv = self.getIVKey()

        print(key)
        print(iv)
        return "toto"
    }

    private func getPrivateKey() -> String {
        let key = self.valet.string(forKey: Const.key)

        if key == nil {
            let newKey = String.randomString(length: 32)
            self.valet.set(string: newKey, forKey: Const.key)

            return newKey
        }

        return key!
    }

    private func getIVKey() -> String {
        let newIVKey = String.randomString(length: 32)
        self.valet.set(string: newIVKey, forKey: Const.iv)

        return newIVKey
    }

    private struct Const {
        static let key = "key_key"
        static let iv = "iv_key"
    }

}
