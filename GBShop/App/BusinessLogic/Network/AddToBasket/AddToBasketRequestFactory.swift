//
//  AddToBasketRequestFactory.swift
//  GBShop
//
//  Created by Зинде Иван on 3/8/21.
//

import Alamofire

protocol AddToBasketRequestFactory {
    func addToBasket(id: Int, quantity: Int, completionHandler: @escaping (AFDataResponse<AddToBasketResult>) -> Void)
}
