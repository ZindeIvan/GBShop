//
//  GetReviews.swift
//  GBShop
//
//  Created by Зинде Иван on 3/8/21.
//

import Foundation
import Alamofire

class GetReviews: AbstractRequestFactory {
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

extension GetReviews: GetReviewsRequestFactory {
    func getReviews(pageNumber: Int,
                    productId: Int,
                    completionHandler: @escaping (AFDataResponse<[GetReviewsResult]>) -> Void) {
        let requestModel = GetReviews(baseUrl: baseUrl, pageNumber: pageNumber, productId: productId)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
}

extension GetReviews {
    struct GetReviews: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .get
        let path: String = "getProducts.json"

        let pageNumber: Int
        let productId: Int
        var parameters: Parameters? {
            return [
                "page_number": pageNumber,
                "id_product": productId
            ]
        }
    }
}
