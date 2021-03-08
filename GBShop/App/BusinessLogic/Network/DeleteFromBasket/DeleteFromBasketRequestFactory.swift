//
//  DeleteFromBasketRequestFactory.swift
//  GBShop
//
//  Created by Зинде Иван on 3/8/21.
//

import Alamofire

protocol DeleteFromBasketRequestFactory {
    func deleteFromBasket(id: Int, completionHandler: @escaping (AFDataResponse<DeleteFromBasketResult>) -> Void)
}
