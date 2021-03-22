//
//  ReviewsFooterView.swift
//  GBShop
//
//  Created by Зинде Иван on 3/22/21.
//

import UIKit

class ReviewsFooterView: UIView {

    private(set) var backButton : UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Back", for: .normal)
        button.backgroundColor = .green
        button.setTitleColor(.black, for: .normal)
        button.setTitleColor(.green, for: .highlighted)
        button.layer.cornerRadius = 16.0
        button.layer.masksToBounds = true
        return button
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
        addSubview(backButton)
        setUpConstraints()
    }

    private func setUpConstraints() {
        let safeArea = safeAreaLayoutGuide
        let heightSpacing : CGFloat = 20.0
        let buttonsWidth : CGFloat = 120.0
        let leadingScreenSpacing : CGFloat = 10.0
        NSLayoutConstraint.activate([
            backButton.topAnchor.constraint(equalTo: topAnchor, constant: heightSpacing),
            backButton.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: leadingScreenSpacing),
            backButton.widthAnchor.constraint(equalToConstant: buttonsWidth)
        ])
    }
}
