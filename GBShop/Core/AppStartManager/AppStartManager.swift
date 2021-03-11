//
//  AppStartManager.swift
//  GBShop
//
//  Created by Зинде Иван on 3/11/21.
//

import UIKit

final class AppStartManager {

    private var window: UIWindow?

    init(window: UIWindow?) {
        self.window = window
    }

    func start() {
        window?.rootViewController = LoginViewController()
        window?.makeKeyAndVisible()
    }
}
