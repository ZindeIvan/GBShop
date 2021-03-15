//
//  AddReviewRequestFactory.swift
//  GBShop
//
//  Created by Зинде Иван on 3/4/21.
//

import Alamofire

protocol AddReviewRequestFactory {
    func addReview(id: Int, text: String, completionHandler: @escaping (AFDataResponse<AddReviewResult>) -> Void)
}
