//
//  DataDecryptor.swift
//  eupraxia
//
//  Created by Thomas Guilleminot on 08/05/2020.
//  Copyright © 2020 Thomas Guilleminot. All rights reserved.
//

import Foundation
import CryptoSwift

enum DecryptionError: Error {
    case couldNotDecrypt
}

final class DataDecryptor {

    private let secretsHandler = SecretsHandler()

    func decrypt(data: String) throws -> String {
        let key = self.secretsHandler.getPrivateKey()
        let iv = self.secretsHandler.getIVKey()

        do {
            let aes = try AES(key: key, iv: iv)
            let encryptedBytes: [UInt8] = Array(hex: data)
            let decryptedBytes = try aes.decrypt(encryptedBytes)

            guard let decryptedText = String(bytes: decryptedBytes, encoding: .utf8) else {
                throw DecryptionError.couldNotDecrypt
            }

            return decryptedText
        } catch {
            throw DecryptionError.couldNotDecrypt
        }
    }

}
