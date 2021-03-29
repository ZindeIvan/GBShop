//
//  ProductsNavigationController.swift
//  GBShop
//
//  Created by Зинде Иван on 3/25/21.
//

import UIKit

class ProductsNavigationController : UINavigationController {

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
        navigationBar.isTranslucent = true
        navigationBar.prefersLargeTitles = false
        let rootVC = ProductsCatalogViewController(requestFactory: requestFactory)
        rootVC.navigationItem.title = "Products"
        viewControllers = [rootVC]
    }
}
