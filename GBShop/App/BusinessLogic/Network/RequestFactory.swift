//
//  RequestFactory.swift
//  GBShop
//
//  Created by Зинде Иван on 2/17/21.
//

import Foundation
import Alamofire

class RequestFactory {

    private var baseURL : String

    init(baseURL : String) {
        self.baseURL = baseURL
    }

    func makeErrorParser() -> AbstractErrorParser {
        return ErrorParser()
    }

    lazy var commonSession: Session = {
        let configuration = URLSessionConfiguration.default
        configuration.httpShouldSetCookies = false
        configuration.headers = .default
        let manager = Session(configuration: configuration)
        return manager
    }()

    let sessionQueue = DispatchQueue.global(qos: .utility)

    func makeAuthRequestFatory() -> AuthRequestFactory {
        let errorParser = makeErrorParser()
        return Auth(baseURL: baseURL,
                    errorParser: errorParser,
                    sessionManager: commonSession,
                    queue: sessionQueue)
    }

    func makeSignUpRequestFatory() -> SignUpRequestFactory {
        let errorParser = makeErrorParser()
        return SignUp(baseURL: baseURL,
                      errorParser: errorParser,
                      sessionManager: commonSession,
                      queue: sessionQueue)
    }

    func makeLogoutRequestFatory() -> LogoutRequestFactory {
        let errorParser = makeErrorParser()
        return Logout(baseURL: baseURL,
                      errorParser: errorParser,
                      sessionManager: commonSession,
                      queue: sessionQueue)
    }

    func makeChangeUserDataRequestFatory() -> ChangeUserDataRequestFactory {
        let errorParser = makeErrorParser()
        return ChangeUserData(baseURL: baseURL,
                              errorParser: errorParser,
                              sessionManager: commonSession,
                              queue: sessionQueue)
    }

    func makeGetProductsCatalogRequestFactory() -> GetProductsCatalogRequestFactory {
        let errorParser = makeErrorParser()
        return GetProductsCatalog(baseURL: baseURL,
                                  errorParser: errorParser,
                                  sessionManager: commonSession,
                                  queue: sessionQueue)
    }

    func makeGetProductByIdRequestFactory() -> GetProductByIdRequestFactory {
        let errorParser = makeErrorParser()
        return GetProductById(baseURL: baseURL,
                              errorParser: errorParser,
                              sessionManager: commonSession,
                              queue: sessionQueue)
    }

    func makeAddReviewRequestFactory() -> AddReviewRequestFactory {
        let errorParser = makeErrorParser()
        return AddReview(baseURL: baseURL,
                         errorParser: errorParser,
                         sessionManager: commonSession,
                         queue: sessionQueue)
    }

    func makeRemoveReviewRequestFactory() -> RemoveReviewRequestFactory {
        let errorParser = makeErrorParser()
        return RemoveReview(baseURL: baseURL,
                            errorParser: errorParser,
                            sessionManager: commonSession,
                            queue: sessionQueue)
    }

    func makeApproveReviewRequestFactory() -> ApproveReviewRequestFactory {
        let errorParser = makeErrorParser()
        return ApproveReview(baseURL: baseURL,
                             errorParser: errorParser,
                             sessionManager: commonSession,
                             queue: sessionQueue)
    }

    func makeGetReviewsRequestFactory() -> GetReviewsRequestFactory {
        let errorParser = makeErrorParser()
        return GetReviews(baseURL: baseURL,
                             errorParser: errorParser,
                             sessionManager: commonSession,
                             queue: sessionQueue)
    }

    func makeAddToBasketRequestFactory() -> AddToBasketRequestFactory {
        let errorParser = makeErrorParser()
        return AddToBasket(baseURL: baseURL,
                             errorParser: errorParser,
                             sessionManager: commonSession,
                             queue: sessionQueue)
    }

    func makeDeleteFromBasketRequestFactory() -> DeleteFromBasketRequestFactory {
        let errorParser = makeErrorParser()
        return DeleteFromBasket(baseURL: baseURL,
                             errorParser: errorParser,
                             sessionManager: commonSession,
                             queue: sessionQueue)
    }

    func makePayBasketRequestFactory() -> PayBasketRequestFactory {
        let errorParser = makeErrorParser()
        return PayBasket(baseURL: baseURL,
                             errorParser: errorParser,
                             sessionManager: commonSession,
                             queue: sessionQueue)
    }
}
