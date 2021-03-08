//
//  LogOut.swift
//  GBShop
//
//  Created by Зинде Иван on 2/17/21.
//

import Foundation
import Alamofire

class Logout: AbstractRequestFactory {
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

extension Logout: LogoutRequestFactory {
    func logout(id: Int, completionHandler: @escaping (AFDataResponse<LogoutResult>) -> Void) {
        let requestModel = Logout(baseUrl: baseUrl, id: id)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
}

extension Logout {
    struct Logout: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .get
        let path: String = "logout.json"

        let id: Int
        var parameters: Parameters? {
            return [
                "id_user": id
            ]
        }
    }
}
