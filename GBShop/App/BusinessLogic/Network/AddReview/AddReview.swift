//
//  AddReview.swift
//  GBShop
//
//  Created by Зинде Иван on 3/4/21.
//

import Foundation
import Alamofire

class AddReview: AbstractRequestFactory {
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

extension AddReview: AddReviewRequestFactory {
    func addReview(id: Int, text: String, completionHandler: @escaping (AFDataResponse<AddReviewResult>) -> Void) {
        let requestModel = AddReview(baseUrl: baseUrl, id: id, text: text)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
}

extension AddReview {
    struct AddReview: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .get
        let path: String = "addReview.json"

        let id: Int
        let text: String
        var parameters: Parameters? {
            return [
                "id_user": id,
                "text": text
            ]
        }
    }
}
