//
//  AddToBasket.swift
//  GBShop
//
//  Created by Зинде Иван on 3/8/21.
//

import Foundation
import Alamofire

class AddToBasket: AbstractRequestFactory {
    let errorParser: AbstractErrorParser
    let sessionManager: Session
    let queue: DispatchQueue
    let baseUrl : URL

    init(
        baseURL: String,
        errorParser: AbstractErrorParser,
        sessionManager: Session,
        queue: DispatchQueue = DispatchQueue.global(qos: .utility)) {
        self.errorParser = errorParser
        self.sessionManager = sessionManager
        self.queue = queue
        self.baseUrl = URL(string:baseURL)!
    }
}

extension AddToBasket: AddToBasketRequestFactory {
    func addToBasket(id: Int, quantity: Int, completionHandler: @escaping (AFDataResponse<AddToBasketResult>) -> Void) {
        let requestModel = AddToBasket(baseUrl: baseUrl, id: id, quantity: quantity)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
}

extension AddToBasket {
    struct AddToBasket: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .get
        let path: String = "addToBasket.json"

        let id: Int
        let quantity: Int
        var parameters: Parameters? {
            return [
                "id_product": id,
                "quantity": quantity
            ]
        }
    }
}
