//
//  ChangeUserDataRequestFactory.swift
//  GBShop
//
//  Created by Зинде Иван on 2/17/21.
//

import Alamofire

protocol ChangeUserDataRequestFactory {
    func changeUserData(id: Int, userName: String, password: String, email: String, gender: String, creditCard: String, bio: String, completionHandler: @escaping (AFDataResponse<ChangeUserDataResult>) -> Void)
}
