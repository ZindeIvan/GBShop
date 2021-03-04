//
//  ProductsCatalogResult.swift
//  GBShop
//
//  Created by Зинде Иван on 2/22/21.
//

import Foundation

struct ProductsCatalogResult: Codable {
    let id: Int
    let productName: String
    let price: Int

    enum CodingKeys: String, CodingKey {
        case id = "id_product"
        case productName = "product_name"
        case price
    }
}
