//
//  GetReviewsResult.swift
//  GBShop
//
//  Created by Зинде Иван on 3/8/21.
//

import Foundation

struct GetReviewsResult: Codable {
    let id: Int
    let text: String

    enum CodingKeys: String, CodingKey {
        case id = "id_comment"
        case text
    }
}
