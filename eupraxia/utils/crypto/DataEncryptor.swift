//
//  DataEncryptor.swift
//  eupraxia
//
//  Created by Thomas Guilleminot on 08/05/2020.
//  Copyright © 2020 Thomas Guilleminot. All rights reserved.
//

import Foundation
import CryptoSwift

enum EncryptionError: Error {
    case couldNotEncrypt
}

final class DataEncryptor {

    private let secretsHandler = SecretsHandler()

    func encrypt(data: String) throws -> String {
        let key = self.secretsHandler.getPrivateKey()
        let iv = self.secretsHandler.getIVKey()

        do {
            let aes = try AES(key: key, iv: iv)
            let encryptedText = try aes.encrypt(Array(data.utf8))

            return encryptedText.toHexString()
        } catch {
            throw EncryptionError.couldNotEncrypt
        }
    }
}
