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
        viewControllers = [initialTabBar, secondTabBar, finalTabBar]
    }

    lazy public var initialTabBar: ProductsNavigationController = {

        let tabBar = ProductsNavigationController(requestFactory: requestFactory)
        let title = "Products"
        let tabBarItem = UITabBarItem(title: title,
                                      image:UIImage(systemName: "tablecells"),
                                      selectedImage:UIImage(systemName: "tablecells.fill"))
        tabBar.tabBarItem = tabBarItem

        return tabBar
    }()

    lazy public var secondTabBar: UserInfoPageViewController = {

        let tabBar = UserInfoPageViewController(requestFactory: requestFactory)
        let title = "User"
        let tabBarItem = UITabBarItem(title: title,
                                      image:UIImage(systemName: "person.crop.square"),
                                      selectedImage:UIImage(systemName: "person.crop.square.fill"))
        tabBar.tabBarItem = tabBarItem

        return tabBar
    }()

    lazy public var finalTabBar: BasketViewController = {

        let tabBar = BasketViewController(requestFactory: requestFactory)
        let title = "Cart"
        let tabBarItem = UITabBarItem(title: title,
                                      image:UIImage(systemName: "cart"),
                                      selectedImage:UIImage(systemName: "cart.fill"))
        tabBar.tabBarItem = tabBarItem

        return tabBar
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
