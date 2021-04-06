//
//  FireBaseAnalytics.swift
//  GBShop
//
//  Created by Зинде Иван on 3/29/21.
//

import Foundation
import FirebaseAnalytics

class FBAnalytics {

    static var shared: FBAnalytics = {
        let instance = FBAnalytics()
        return instance
    }()

    private init() {}

    func trackLogin(failed: Bool, error: String?) {
        Analytics.logEvent("Login", parameters: [
            "failed": failed,
            "errorDescription" : error ?? ""
        ])
    }

    func trackLogout(failed: Bool, error: String?) {
        Analytics.logEvent("Logout", parameters: [
            "failed": failed,
            "errorDescription" : error ?? ""
        ])
    }

    func trackSignUp(failed: Bool, error: String?) {
        Analytics.logEvent("SignUp", parameters: [
            "failed": failed,
            "errorDescription" : error ?? ""
        ])
    }

    func trackOpenProductsCatalog() {
        Analytics.logEvent("OpenProductsCatalog", parameters: [
            "value": "Opened catalog list" as String
        ])
    }

    func trackOpenProductPage(productId: Int) {
        Analytics.logEvent("OpenProductPage", parameters: [
            "productId": productId
        ])
    }

    func trackAddToBasket(productId: Int, failed: Bool, error: String?) {
        Analytics.logEvent("AddToBasket", parameters: [
            "productId": productId,
            "failed": failed,
            "errorDescription" : error ?? ""
        ])
    }

    func trackRemoveFromeBasket(productId: Int, failed: Bool, error: String?) {
        Analytics.logEvent("RemoveFromeBasket", parameters: [
            "productId": productId,
            "failed": failed,
            "errorDescription" : error ?? ""
        ])
    }

    func trackPay(userId: Int, failed: Bool, error: String?) {
        Analytics.logEvent("PayBasket", parameters: [
            "userId": userId,
            "failed": failed,
            "errorDescription" : error ?? ""
        ])
    }

    func trackAddReview(userId: Int, productId: Int, failed: Bool, error: String?) {
        Analytics.logEvent("AddReview", parameters: [
            "userId": userId,
            "productId": productId,
            "failed": failed,
            "errorDescription" : error ?? ""
        ])
    }
}

extension FBAnalytics: NSCopying {

    func copy(with zone: NSZone? = nil) -> Any {
        return self
    }
}
