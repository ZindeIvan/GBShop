//
//  ApproveReviewRequestFactory.swift
//  GBShop
//
//  Created by Зинде Иван on 3/4/21.
//

import Alamofire

protocol ApproveReviewRequestFactory {
    func approveReview(id: Int, completionHandler: @escaping (AFDataResponse<ApproveReviewResult>) -> Void)
}
