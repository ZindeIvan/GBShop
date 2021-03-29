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
        reviewsView.sendButton.addTarget(self,action: #selector(sendButtonAction), for: .touchUpInside)
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

    @objc func sendButtonAction(sender: UIButton!) {
        let addReview = requestFactory.makeAddReviewRequestFactory()
        addReview.addReview(id: productId, text: reviewsView.reviewTextField.text ?? "") { response in
            switch response.result {
            case .success(let addReview):
                print(addReview.result, 1)
                print(addReview.userMessage)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
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
        cell.delegate = self
        cell.configure(with: review.text, index: indexPath.row)
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}

extension ReviewsViewController: UITableViewDelegate {

}

extension ReviewsViewController: ReviewsCellDelegate {

    func approveButtonTapped(index: Int) {
        let approveReview = requestFactory.makeApproveReviewRequestFactory()
        approveReview.approveReview(id: reviews[index].id) { response in
            switch response.result {
            case .success(let approveReview):
                print(approveReview.result)
                print("Review approved")
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
