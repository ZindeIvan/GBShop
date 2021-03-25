//
//  BasketViewController.swift
//  GBShop
//
//  Created by Зинде Иван on 3/25/21.
//

import UIKit

final class BasketViewController: UIViewController {

    private lazy var basketView: BasketView = {
        BasketView()
    }()

    private var requestFactory : RequestFactory

    var basketItems = [BasketItem]() {
        didSet {
            basketView.tableView.reloadData()
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
        view = basketView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        basketView.tableView.register(BasketCell.self,
                                               forCellReuseIdentifier: Constants.reuseIdentifier)
        basketView.tableView.delegate = self
        basketView.tableView.dataSource = self
        loadBasket()
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }

    private func loadBasket() {
        let getProductsCatalog = requestFactory.makeGetProductsCatalogRequestFactory()
        getProductsCatalog.getProductsCatalog(pageNumber: 1, categoryId: 1) { response in
            switch response.result {
            case .success(let productsCatalog):
                DispatchQueue.main.async {
                    self.basketItems = []
                    self.basketItems = productsCatalog.map { self.getBasketItemProductsResult(productResult: $0) }
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }

    private func getBasketItemProductsResult(productResult: ProductsCatalogResult) -> BasketItem {
        return BasketItem(product: productResult.productName,
                       price: Double(productResult.price),
                       count: Int.random(in: 0...10),
                       id: productResult.id)
    }
}

extension BasketViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return basketItems.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let dequeuedCell = tableView.dequeueReusableCell(withIdentifier: Constants.reuseIdentifier, for: indexPath)
        guard let cell = dequeuedCell as? BasketCell else {
            return dequeuedCell
        }
        let item = basketItems[indexPath.row]
        cell.configure(with: item, index: indexPath.row)
        cell.delegate = self
        return cell
    }
}

extension BasketViewController: UITableViewDelegate {

}

extension BasketViewController: BasketCellDelegate {
    func countValueChanged(index: Int, count: Int) {
        print("\(index) count: \(count)")
    }

    func deleteButtonTapped(index: Int) {
        print("\(index)")
    }
}
