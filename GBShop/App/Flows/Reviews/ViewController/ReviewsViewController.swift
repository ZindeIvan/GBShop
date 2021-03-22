//
//  ReviewsViewController.swift
//  GBShop
//
//  Created by Зинде Иван on 3/22/21.
//

import UIKit

final class ReviewsViewController: UIViewController {

    private lazy var reviewsView: ReviewsView = {
        ReviewsView()
    }()

    private var requestFactory : RequestFactory

    private var productId : Int

    private var reviews = [Review]() {
        didSet {
            reviewsView.tableView.reloadData()
        }
    }

    private struct Constants {
        static let reuseIdentifier = "reuseId"
    }

    init(requestFactory: RequestFactory, productId : Int) {
        self.productId = productId
        self.requestFactory = requestFactory
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        super.loadView()
        view = reviewsView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        reviewsView.tableView.register(ReviewsCell.self,
                                               forCellReuseIdentifier: Constants.reuseIdentifier)
        reviewsView.tableView.delegate = self
        reviewsView.tableView.dataSource = self
        loadReviews()
    }

    private func loadReviews() {
        let reviews = requestFactory.makeGetReviewsRequestFactory()
        reviews.getReviews(pageNumber: 0,
                           productId: productId) { response in
            switch response.result {
            case .success(let rewiews):
                DispatchQueue.main.async {
                    self.reviews = []
                    self.reviews = rewiews.map { self.getReviewFromReviewResult(reviewResult: $0) }
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }

    private func getReviewFromReviewResult(reviewResult: GetReviewsResult) -> Review {
        return Review(text: reviewResult.text, id: reviewResult.id)
    }
}

extension ReviewsViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return reviews.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let dequeuedCell = tableView.dequeueReusableCell(withIdentifier: Constants.reuseIdentifier, for: indexPath)
        guard let cell = dequeuedCell as? ReviewsCell else {
            return dequeuedCell
        }
        let review = reviews[indexPath.row]
        cell.configure(with: review.text)
        return cell
    }
}

extension ReviewsViewController: UITableViewDelegate {

}
