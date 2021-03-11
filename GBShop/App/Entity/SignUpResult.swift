//
//  SignUpResult.swift
//  GBShop
//
//  Created by Зинде Иван on 2/17/21.
//

import Foundation

struct SignUpResult: Codable {
    let result: Int
    let userMessage: String

    enum CodingKeys: String, CodingKey {
        case userMessage = "user_message"
        case result
    }
}
