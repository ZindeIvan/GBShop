//
//  GetProductsCatalog.swift
//  GBShop
//
//  Created by Зинде Иван on 2/22/21.
//

import Foundation
import Alamofire

class GetProductsCatalog: AbstractRequestFactory {
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

extension GetProductsCatalog: GetProductsCatalogRequestFactory {
    func getProductsCatalog(pageNumber: Int,
                            categoryId: Int,
                            completionHandler: @escaping (AFDataResponse<[ProductsCatalogResult]>) -> Void) {
        let requestModel = GetProductsCatalog(baseUrl: baseUrl, pageNumber: pageNumber, categoryId: categoryId)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
}

extension GetProductsCatalog {
    struct GetProductsCatalog: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .get
        let path: String = "catalogData.json"

        let pageNumber: Int
        let categoryId: Int
        var parameters: Parameters? {
            return [
                "page_number": pageNumber,
                "id_category": categoryId
            ]
        }
    }
}
