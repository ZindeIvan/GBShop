//
//  PayBasketRequestFactory.swift
//  GBShop
//
//  Created by Зинде Иван on 3/8/21.
//

import Alamofire

protocol PayBasketRequestFactory {
    func payBasket(id: Int, completionHandler: @escaping (AFDataResponse<PayBasketResult>) -> Void)
}
