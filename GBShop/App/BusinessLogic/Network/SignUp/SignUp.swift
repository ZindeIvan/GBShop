//
//  SignUp.swift
//  GBShop
//
//  Created by Зинде Иван on 2/17/21.
//

import Foundation
import Alamofire

class SignUp: AbstractRequestFactory {
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

extension SignUp: SignUpRequestFactory {
    func signUp(id: Int,
                userName: String,
                password: String,
                email: String,
                gender: String,
                creditCard: String,
                bio: String,
                completionHandler: @escaping (AFDataResponse<SignUpResult>) -> Void) {
        let requestModel = SignUp( baseUrl: baseUrl,
                                   id: id,
                                   login: userName,
                                   password: password,
                                   email: email,
                                   gender: gender,
                                   creditCard: creditCard,
                                   bio: bio)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
}

extension SignUp {
    struct SignUp: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .post
        let path: String = "register"

        let id: Int
        let login: String
        let password: String
        let email: String
        let gender: String
        let creditCard: String
        let bio: String
        var parameters: Parameters? {
            return [
                "id_user": id,
                "username": login,
                "password": password,
                "email": email,
                "gender": gender,
                "credit_card": creditCard,
                "bio": bio
            ]
        }
    }
}
