//
//  ReviewsView.swift
//  GBShop
//
//  Created by Зинде Иван on 3/22/21.
//

import UIKit

class ReviewsView: UIView {

    let tableView = UITableView()

    private(set) var sendButton : UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Send", for: .normal)
        button.backgroundColor = .green
        button.setTitleColor(.black, for: .normal)
        button.setTitleColor(.green, for: .highlighted)
        button.layer.cornerRadius = 16.0
        button.layer.masksToBounds = true
        return button
    }()

    private(set) var reviewTextField : UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Enter text here"
        textField.textColor = .black
        textField.backgroundColor = .lightGray
        textField.borderStyle = .roundedRect
        textField.layer.cornerRadius = 5.0
        textField.layer.masksToBounds = true
        return textField
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configureUI()
    }

    private func configureUI() {
        backgroundColor = .white
        addTableView()
        addSubview(sendButton)
        addSubview(reviewTextField)
        setupConstraints()
    }

    private func addTableView() {
        tableView.separatorInset = UIEdgeInsets(top: 0.0, left: 12.0, bottom: 0.0, right: 0.0)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(self.tableView)
    }

    private func setupConstraints() {
        let safeArea = safeAreaLayoutGuide
        let heightSpacing : CGFloat = 10.0
        let buttonsWidth : CGFloat = 120.0
        let leadingScreenSpacing : CGFloat = 10.0
        let reviewTextFieldHeight : CGFloat = 100.0
        NSLayoutConstraint.activate([
            reviewTextField.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: heightSpacing),
            reviewTextField.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: leadingScreenSpacing),
            reviewTextField.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor,
                                                      constant: -leadingScreenSpacing),
            reviewTextField.heightAnchor.constraint(equalToConstant: reviewTextFieldHeight),
            sendButton.topAnchor.constraint(equalTo: reviewTextField.bottomAnchor, constant: heightSpacing),
            sendButton.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: leadingScreenSpacing),
            sendButton.widthAnchor.constraint(equalToConstant: buttonsWidth),
            tableView.topAnchor.constraint(equalTo: sendButton.bottomAnchor, constant: heightSpacing),
            tableView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor)
        ])
    }
}
