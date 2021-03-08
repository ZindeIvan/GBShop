//
//  GetProductById.swift
//  GBShop
//
//  Created by Зинде Иван on 2/22/21.
//

import Foundation
import Alamofire

class GetProductById: AbstractRequestFactory {
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

extension GetProductById: GetProductByIdRequestFactory {
    func getProductById(id: Int, completionHandler: @escaping (AFDataResponse<ProductResult>) -> Void) {
        let requestModel = GetProductById(baseUrl: baseUrl, id: id)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
}

extension GetProductById {
    struct GetProductById: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .get
        let path: String = "getGoodById.json"

        let id: Int
        var parameters: Parameters? {
            return [
                "id_product": id
            ]
        }
    }
}
