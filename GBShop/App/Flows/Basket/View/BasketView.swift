//
//  BasketView.swift
//  GBShop
//
//  Created by Зинде Иван on 3/25/21.
//

import UIKit

class BasketView : UIView {

    let tableView = UITableView()

    private(set) var buyButton : UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Buy", for: .normal)
        button.backgroundColor = .green
        button.setTitleColor(.black, for: .normal)
        button.setTitleColor(.green, for: .highlighted)
        button.layer.cornerRadius = 16.0
        button.layer.masksToBounds = true
        return button
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
        setupConstraints()
    }

    private func addTableView() {
        tableView.separatorInset = UIEdgeInsets(top: 0.0, left: 12.0, bottom: 0.0, right: 0.0)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(tableView)
        addSubview(buyButton)
    }

    private func setupConstraints() {
        let safeArea = safeAreaLayoutGuide
        let heightSpacing : CGFloat = 10.0
        let buttonsWidth : CGFloat = 120.0
        let leadingScreenSpacing : CGFloat = 10.0
        NSLayoutConstraint.activate([
            buyButton.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: heightSpacing),
            buyButton.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: leadingScreenSpacing),
            buyButton.widthAnchor.constraint(equalToConstant: buttonsWidth),
            tableView.topAnchor.constraint(equalTo: buyButton.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor)
        ])
    }
}
