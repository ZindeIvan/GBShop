//
//  ReviewsFooterView.swift
//  GBShop
//
//  Created by Зинде Иван on 3/22/21.
//

import UIKit

class ReviewsFooterView: UIView {

    weak var delegate : ReviewsFooterViewDelegate?

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
        setUpSubviews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setUpSubviews() {
        backgroundColor = .white
        addSubview(sendButton)
        addSubview(reviewTextField)
        setUpConstraints()
        sendButton.addTarget(self,action: #selector(sendButtonAction), for: .touchUpInside)
    }

    private func setUpConstraints() {
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
            sendButton.widthAnchor.constraint(equalToConstant: buttonsWidth)
        ])
    }

    @objc func sendButtonAction(sender: UIButton!) {
        guard let text = reviewTextField.text else { return }
        delegate?.sendButtonTapped(reviewText: text)
    }
}
