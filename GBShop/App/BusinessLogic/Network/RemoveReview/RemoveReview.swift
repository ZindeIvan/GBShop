//
//  RemoveReview.swift
//  GBShop
//
//  Created by Зинде Иван on 3/4/21.
//

import Foundation
import Alamofire

class RemoveReview: AbstractRequestFactory {
    let errorParser: AbstractErrorParser
    let sessionManager: Session
    let queue: DispatchQueue
    let baseUrl = URL(string:
                        "https://raw.githubusercontent.com/GeekBrainsTutorial/online-store-api/master/responses/")!

    init(
        errorParser: AbstractErrorParser,
        sessionManager: Session,
        queue: DispatchQueue = DispatchQueue.global(qos: .utility)) {
        self.errorParser = errorParser
        self.sessionManager = sessionManager
        self.queue = queue
    }
}

extension RemoveReview: RemoveReviewRequestFactory {
    func removeReview(id: Int, completionHandler: @escaping (AFDataResponse<RemoveReviewResult>) -> Void) {
        let requestModel = RemoveReview(baseUrl: baseUrl, id: id)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
}

extension RemoveReview {
    struct RemoveReview: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .get
        let path: String = "removeReview.json"

        let id: Int
        var parameters: Parameters? {
            return [
                "id_comment": id
            ]
        }
    }
}