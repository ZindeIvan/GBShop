//
//  LogoutRequestFactory.swift
//  GBShop
//
//  Created by Зинде Иван on 2/17/21.
//

import Alamofire

protocol LogoutRequestFactory {
    func logout(id: Int, completionHandler: @escaping (AFDataResponse<LogoutResult>) -> Void)
}
