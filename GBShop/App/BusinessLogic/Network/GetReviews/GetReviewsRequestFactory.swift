//
//  GetReviewsRequestFactory.swift
//  GBShop
//
//  Created by Зинде Иван on 3/8/21.
//

import Alamofire

protocol GetReviewsRequestFactory {
    func getReviews(pageNumber: Int,
                    productId: Int,
                    completionHandler: @escaping (AFDataResponse<[GetReviewsResult]>) -> Void)
}
