//
//  AppStartManager.swift
//  GBShop
//
//  Created by Зинде Иван on 3/11/21.
//

import UIKit

final class AppStartManager {

    private var window: UIWindow?
    private var requestFactory : RequestFactory

    init(window: UIWindow?, requestFactory : RequestFactory) {
        self.window = window
        self.requestFactory = requestFactory
    }

    func start() {
        window?.rootViewController = LoginViewController(requestFactory: requestFactory)
        window?.makeKeyAndVisible()
    }
}
