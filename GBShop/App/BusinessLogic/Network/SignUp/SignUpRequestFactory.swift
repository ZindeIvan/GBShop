//
//  SignUpRequestFactory.swift
//  GBShop
//
//  Created by Зинде Иван on 2/17/21.
//

import Alamofire

protocol SignUpRequestFactory {
    func signUp(id: Int, userName: String, password: String, email: String, gender: String, creditCard: String, bio: String, completionHandler: @escaping (AFDataResponse<SignUpResult>) -> Void)
}
