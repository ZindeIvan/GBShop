//
//  ProductsCatalogViewController.swift
//  GBShop
//
//  Created by Зинде Иван on 3/17/21.
//

import UIKit

final class ProductsCatalogViewController: UIViewController {

    private lazy var productsCatalogView: ProductsCatalogView = {
        ProductsCatalogView()
    }()

    private var requestFactory : RequestFactory

    var products = [Product]() {
        didSet {
            productsCatalogView.tableView.reloadData()
        }
    }

    private struct Constants {
        static let reuseIdentifier = "reuseId"
    }

    init(requestFactory: RequestFactory) {
        self.requestFactory = requestFactory
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        super.loadView()
        view = productsCatalogView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        productsCatalogView.tableView.register(ProductsCatalogCell.self,
                                               forCellReuseIdentifier: Constants.reuseIdentifier)
        productsCatalogView.tableView.delegate = self
        productsCatalogView.tableView.dataSource = self
        loadProductsCatalog()
        FBAnalytics.shared.trackOpenProductsCatalog()
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }

    private func loadProductsCatalog() {
        let getProductsCatalog = requestFactory.makeGetProductsCatalogRequestFactory()
        getProductsCatalog.getProductsCatalog(pageNumber: 1, categoryId: 1) { response in
            switch response.result {
            case .success(let productsCatalog):
                DispatchQueue.main.async {
                    self.products = []
                    self.products = productsCatalog.map { self.getProductFromProductsResult(productResult: $0) }
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }

    private func getProductFromProductsResult(productResult: ProductsCatalogResult) -> Product {
        return Product(product: productResult.productName,
                       price: Double(productResult.price),
                       description: "Description placeholder \nDescription placeholder",
                       id: productResult.id)
    }
}

extension ProductsCatalogViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let dequeuedCell = tableView.dequeueReusableCell(withIdentifier: Constants.reuseIdentifier, for: indexPath)
        guard let cell = dequeuedCell as? ProductsCatalogCell else {
            return dequeuedCell
        }
        let product = products[indexPath.row]
        cell.configure(with: product)
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let productInfoPageViewController = ProductInfoPageViewController(requestFactory: requestFactory,
                                                                          product: products[indexPath.row])
        navigationController?.pushViewController(productInfoPageViewController, animated: true)
    }
}

extension ProductsCatalogViewController: UITableViewDelegate {

}
