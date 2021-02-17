//
//  AuthRequestFactory.swift
//  GBShop
//
//  Created by Зинде Иван on 2/17/21.
//

import Alamofire

protocol AuthRequestFactory {
    func login(userName: String, password: String, completionHandler: @escaping (AFDataResponse<LoginResult>) -> Void)
}
