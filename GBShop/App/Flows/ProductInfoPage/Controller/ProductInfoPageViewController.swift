//
//  ProductInfoPageViewController.swift
//  GBShop
//
//  Created by Зинде Иван on 3/22/21.
//

import UIKit

class ProductInfoPageViewController: UIViewController {

    private lazy var productInfoPageView: ProductInfoPageView = {
        return ProductInfoPageView()
    }()

    private var requestFactory : RequestFactory

    private var product : Product

    init(requestFactory: RequestFactory, product: Product) {
        self.requestFactory = requestFactory
        self.product = product
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        view = productInfoPageView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }

    private func configureUI() {
        productInfoPageView.reviewsButton.addTarget(self,
                                                    action: #selector(reviewsButtonAction),
                                                    for: .touchUpInside)
        productInfoPageView.addToCartButton.addTarget(self,
                                                    action: #selector(addToCartButtonAction),
                                                    for: .touchUpInside)
        productInfoPageView.productNameLabel.text = product.product
        productInfoPageView.priceLabel.text = String(format: "%.2f", product.price) + " руб."
        productInfoPageView.descriptionLabel.text = product.description
    }

    @objc func reviewsButtonAction(sender: UIButton!) {
        let reviewsViewController = ReviewsViewController(requestFactory: requestFactory,
                                                          productId: product.id)
        navigationController?.pushViewController(reviewsViewController, animated: true)
    }

    @objc func addToCartButtonAction(sender: UIButton!) {
        let addToBasket = requestFactory.makeAddToBasketRequestFactory()
        addToBasket.addToBasket(id: product.id, quantity: 1) { response in
            switch response.result {
            case .success(let addToBasket):
                print(addToBasket.result)
                print("Added to cart")
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
