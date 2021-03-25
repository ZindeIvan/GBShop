//
//  ProductInfoPageView.swift
//  GBShop
//
//  Created by Зинде Иван on 3/22/21.
//

import UIKit

class ProductInfoPageView: UIView {

    private(set) var reviewsButton : UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Reviews", for: .normal)
        button.backgroundColor = .green
        button.setTitleColor(.black, for: .normal)
        button.setTitleColor(.green, for: .highlighted)
        button.layer.cornerRadius = 16.0
        button.layer.masksToBounds = true
        return button
    }()

    private(set) var addToCartButton : UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Add to Cart", for: .normal)
        button.backgroundColor = .green
        button.setTitleColor(.black, for: .normal)
        button.setTitleColor(.green, for: .highlighted)
        button.layer.cornerRadius = 16.0
        button.layer.masksToBounds = true
        return button
    }()

    private(set) var productNameLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.backgroundColor = .white
        label.layer.masksToBounds = true
        return label
    }()

    private(set) var priceLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.backgroundColor = .white
        label.layer.masksToBounds = true
        return label
    }()

    private(set) var descriptionLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.backgroundColor = .white
        label.layer.masksToBounds = true
        label.numberOfLines = 0
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpSubviews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setUpSubviews() {
        backgroundColor = .white
        addSubview(productNameLabel)
        addSubview(priceLabel)
        addSubview(descriptionLabel)
        addSubview(addToCartButton)
        addSubview(reviewsButton)
        setUpConstraints()
    }

    private func setUpConstraints() {
        let safeArea = safeAreaLayoutGuide
        let labelsWidth : CGFloat = 150.0
        let heightSpacing : CGFloat = 20.0
        let topScreenSpacing : CGFloat = 10.0
        let buttonsWidth : CGFloat = 120.0
        let leadingScreenSpacing : CGFloat = 10.0
        NSLayoutConstraint.activate([
            productNameLabel.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: topScreenSpacing),
            productNameLabel.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: leadingScreenSpacing),
            productNameLabel.widthAnchor.constraint(equalToConstant: labelsWidth),
            priceLabel.topAnchor.constraint(equalTo: productNameLabel.bottomAnchor, constant: heightSpacing),
            priceLabel.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: leadingScreenSpacing),
            priceLabel.widthAnchor.constraint(equalToConstant: labelsWidth),
            descriptionLabel.topAnchor.constraint(equalTo: priceLabel.bottomAnchor, constant: heightSpacing),
            descriptionLabel.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: leadingScreenSpacing),
            descriptionLabel.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor,
                                                       constant: -leadingScreenSpacing),
            addToCartButton.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: heightSpacing),
            addToCartButton.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: leadingScreenSpacing),
            addToCartButton.widthAnchor.constraint(equalToConstant: buttonsWidth),
            reviewsButton.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: heightSpacing),
            reviewsButton.leadingAnchor.constraint(equalTo: addToCartButton.trailingAnchor,
                                                   constant: leadingScreenSpacing),
            reviewsButton.widthAnchor.constraint(equalToConstant: buttonsWidth)
        ])
    }
}
