//
//  RemoveReviewRequestFactory.swift
//  GBShop
//
//  Created by Зинде Иван on 3/4/21.
//

import Alamofire

protocol RemoveReviewRequestFactory {
    func removeReview(id: Int, completionHandler: @escaping (AFDataResponse<RemoveReviewResult>) -> Void)
}
