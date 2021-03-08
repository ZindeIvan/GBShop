//
//  ApproveReview.swift
//  GBShop
//
//  Created by Зинде Иван on 3/4/21.
//

import Foundation
import Alamofire

class ApproveReview: AbstractRequestFactory {
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

extension ApproveReview: ApproveReviewRequestFactory {
    func approveReview(id: Int, completionHandler: @escaping (AFDataResponse<ApproveReviewResult>) -> Void) {
        let requestModel = ApproveReview(baseUrl: baseUrl, id: id)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
}

extension ApproveReview {
    struct ApproveReview: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .get
        let path: String = "approveReview.json"

        let id: Int
        var parameters: Parameters? {
            return [
                "id_comment": id
            ]
        }
    }
}
