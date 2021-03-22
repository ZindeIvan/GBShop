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
        navigationController?.navigationBar.prefersLargeTitles = true
        productInfoPageView.backButton.addTarget(self, action: #selector(backButtonAction), for: .touchUpInside)
        productInfoPageView.reviewsButton.addTarget(self,
                                                    action: #selector(reviewsButtonAction),
                                                    for: .touchUpInside)
        productInfoPageView.productNameLabel.text = product.product
        productInfoPageView.priceLabel.text = String(format: "%.2f", product.price) + " руб."
        productInfoPageView.descriptionLabel.text = product.description
    }

    @objc func backButtonAction(sender: UIButton!) {
        dismiss(animated: true, completion: nil)
    }

    @objc func reviewsButtonAction(sender: UIButton!) {
        let reviewsViewController = ReviewsViewController(requestFactory: requestFactory,
                                                          productId: product.id)
        reviewsViewController.modalPresentationStyle = .fullScreen
        reviewsViewController.modalTransitionStyle = .crossDissolve
        present(reviewsViewController, animated: true, completion: nil)
    }
}
