//
//  DeleteFromBasket.swift
//  GBShop
//
//  Created by Зинде Иван on 3/8/21.
//

import Foundation
import Alamofire

class DeleteFromBasket: AbstractRequestFactory {
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

extension DeleteFromBasket: DeleteFromBasketRequestFactory {
    func deleteFromBasket(id: Int, completionHandler: @escaping (AFDataResponse<DeleteFromBasketResult>) -> Void) {
        let requestModel = DeleteFromBasket(baseUrl: baseUrl, id: id)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
}

extension DeleteFromBasket {
    struct DeleteFromBasket: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .get
        let path: String = "deleteFromBasket.json"

        let id: Int
        var parameters: Parameters? {
            return [
                "id_product": id
            ]
        }
    }
}
