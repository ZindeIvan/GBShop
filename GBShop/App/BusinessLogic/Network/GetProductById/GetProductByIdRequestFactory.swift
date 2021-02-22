//
//  GetProductByIdRequestFactory.swift
//  GBShop
//
//  Created by Зинде Иван on 2/22/21.
//

import Alamofire

protocol GetProductByIdRequestFactory {
    func getProductById(id: Int, completionHandler: @escaping (AFDataResponse<ProductResult>) -> Void)
}
