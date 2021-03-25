//
//  TabBarController.swift
//  GBShop
//
//  Created by Зинде Иван on 3/18/21.
//

import UIKit

class TabBarController: UITabBarController {

    private var requestFactory : RequestFactory

    init(requestFactory: RequestFactory) {
        self.requestFactory = requestFactory
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(true)
            viewControllers = [initialTabBar, finalTabBar]
        }

        lazy public var initialTabBar: ProductsNavigationController = {

            let initialTabBar = ProductsNavigationController(requestFactory: requestFactory)
            let title = "Products"
            let tabBarItem = UITabBarItem(title: title,
                                          image:UIImage(systemName: "tablecells"),
                                          selectedImage:UIImage(systemName: "tablecells.fill"))
            initialTabBar.tabBarItem = tabBarItem

            return initialTabBar
        }()

        lazy public var finalTabBar: UserInfoPageViewController = {

            let finalTabBar = UserInfoPageViewController(requestFactory: requestFactory)
            let title = "User"
            let tabBarItem = UITabBarItem(title: title,
                                          image:UIImage(systemName: "person.crop.square"),
                                          selectedImage:UIImage(systemName: "person.crop.square.fill"))
            finalTabBar.tabBarItem = tabBarItem

            return finalTabBar
        }()

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
