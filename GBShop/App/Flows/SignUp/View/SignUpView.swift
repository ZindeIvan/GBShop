//
//  SignUpView.swift
//  GBShop
//
//  Created by Зинде Иван on 3/11/21.
//

import UIKit

class SignUpView : UIView {

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

    private(set) var signUpButton : UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Sign up", for: .normal)
        button.backgroundColor = .green
        button.setTitleColor(.black, for: .normal)
        button.setTitleColor(.green, for: .highlighted)
        button.layer.cornerRadius = 16.0
        button.layer.masksToBounds = true
        return button
    }()

    private(set) var usernameTextField : UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Username"
        textField.textColor = .black
        textField.backgroundColor = .lightGray
        textField.borderStyle = .roundedRect
        textField.layer.cornerRadius = 5.0
        textField.layer.masksToBounds = true
        return textField
    }()

    private(set) var passwordTextField : UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Password"
        textField.textColor = .black
        textField.backgroundColor = .lightGray
        textField.borderStyle = .roundedRect
        textField.layer.cornerRadius = 5.0
        textField.layer.masksToBounds = true
        return textField
    }()

    private(set) var emailTextField : UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "abc@mail.com"
        textField.textColor = .black
        textField.backgroundColor = .lightGray
        textField.borderStyle = .roundedRect
        textField.layer.cornerRadius = 5.0
        textField.layer.masksToBounds = true
        return textField
    }()

    private(set) var creditCardTextField : UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "0000000-0000-000000-000"
        textField.textColor = .black
        textField.backgroundColor = .lightGray
        textField.borderStyle = .roundedRect
        textField.layer.cornerRadius = 5.0
        textField.layer.masksToBounds = true
        return textField
    }()

    private(set) var bioTextField : UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Some text"
        textField.textColor = .black
        textField.backgroundColor = .lightGray
        textField.borderStyle = .roundedRect
        textField.layer.cornerRadius = 5.0
        textField.layer.masksToBounds = true
        return textField
    }()

    private(set) var genderSegmentedControl : UISegmentedControl = {
        let items = ["Male", "Female"]
        let segmentedControl = UISegmentedControl(items: items)
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        segmentedControl.backgroundColor = .lightGray
        segmentedControl.tintColor = .black
        segmentedControl.layer.cornerRadius = 5.0
        segmentedControl.layer.masksToBounds = true
        segmentedControl.selectedSegmentIndex = 0
        return segmentedControl
    }()

    private(set) var usernameLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Username: "
        label.textColor = .black
        label.backgroundColor = .white
        label.layer.masksToBounds = true
        return label
    }()

    private(set) var passwordLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Password: "
        label.textColor = .black
        label.backgroundColor = .white
        label.layer.masksToBounds = true
        return label
    }()

    private(set) var emailLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "E-Mail: "
        label.textColor = .black
        label.backgroundColor = .white
        label.layer.masksToBounds = true
        return label
    }()

    private(set) var genderLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Gender: "
        label.textColor = .black
        label.backgroundColor = .white
        label.layer.masksToBounds = true
        return label
    }()

    private(set) var creditCardLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Credit card: "
        label.textColor = .black
        label.backgroundColor = .white
        label.layer.masksToBounds = true
        return label
    }()

    private(set) var bioLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Bio: "
        label.textColor = .black
        label.backgroundColor = .white
        label.layer.masksToBounds = true
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
        addSubview(usernameTextField)
        addSubview(passwordTextField)
        addSubview(emailTextField)
        addSubview(genderSegmentedControl)
        addSubview(creditCardTextField)
        addSubview(bioTextField)
        addSubview(usernameLabel)
        addSubview(passwordLabel)
        addSubview(emailLabel)
        addSubview(genderLabel)
        addSubview(creditCardLabel)
        addSubview(bioLabel)
        addSubview(signUpButton)
        addSubview(backButton)
        setUpConstraints()
    }

    private func setUpConstraints() {
        let safeArea = safeAreaLayoutGuide
        let textFieldslsWidth : CGFloat = 200.0
        let labelsWidth : CGFloat = 100.0
        let heightSpacing : CGFloat = 20.0
        let topScreenSpacing : CGFloat = 40.0
        let widthSpacing : CGFloat = 20.0
        let buttonsWidth : CGFloat = 120.0
        let leadingScreenSpacing : CGFloat = 10.0
        NSLayoutConstraint.activate([
            usernameLabel.topAnchor.constraint(equalTo: topAnchor, constant: topScreenSpacing),
            usernameLabel.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: leadingScreenSpacing),
            usernameLabel.widthAnchor.constraint(equalToConstant: labelsWidth),
            passwordLabel.topAnchor.constraint(equalTo: usernameLabel.bottomAnchor, constant: heightSpacing),
            passwordLabel.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: leadingScreenSpacing),
            passwordLabel.widthAnchor.constraint(equalToConstant: labelsWidth),
            emailLabel.topAnchor.constraint(equalTo: passwordLabel.bottomAnchor, constant: heightSpacing),
            emailLabel.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: leadingScreenSpacing),
            emailLabel.widthAnchor.constraint(equalToConstant: labelsWidth),
            genderLabel.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: heightSpacing),
            genderLabel.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: leadingScreenSpacing),
            genderLabel.widthAnchor.constraint(equalToConstant: labelsWidth),
            creditCardLabel.topAnchor.constraint(equalTo: genderLabel.bottomAnchor, constant: heightSpacing),
            creditCardLabel.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: leadingScreenSpacing),
            creditCardLabel.widthAnchor.constraint(equalToConstant: labelsWidth),
            bioLabel.topAnchor.constraint(equalTo: creditCardLabel.bottomAnchor, constant: heightSpacing),
            bioLabel.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: leadingScreenSpacing),
            bioLabel.widthAnchor.constraint(equalToConstant: labelsWidth),
            usernameTextField.topAnchor.constraint(equalTo: topAnchor, constant: topScreenSpacing),
            usernameTextField.leadingAnchor.constraint(equalTo: usernameLabel.trailingAnchor, constant: widthSpacing),
            usernameTextField.widthAnchor.constraint(equalToConstant: textFieldslsWidth),
            passwordTextField.topAnchor.constraint(equalTo: usernameLabel.bottomAnchor, constant: heightSpacing),
            passwordTextField.leadingAnchor.constraint(equalTo: passwordLabel.trailingAnchor, constant: widthSpacing),
            passwordTextField.widthAnchor.constraint(equalToConstant: textFieldslsWidth),
            emailTextField.topAnchor.constraint(equalTo: passwordLabel.bottomAnchor, constant: heightSpacing),
            emailTextField.leadingAnchor.constraint(equalTo: emailLabel.trailingAnchor, constant: widthSpacing),
            emailTextField.widthAnchor.constraint(equalToConstant: textFieldslsWidth),
            genderSegmentedControl.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: heightSpacing),
            genderSegmentedControl.leadingAnchor.constraint(equalTo: genderLabel.trailingAnchor,constant:widthSpacing),
            genderSegmentedControl.widthAnchor.constraint(equalToConstant: textFieldslsWidth),
            creditCardTextField.topAnchor.constraint(equalTo: genderLabel.bottomAnchor, constant: heightSpacing),
            creditCardTextField.leadingAnchor.constraint(equalTo: creditCardLabel.trailingAnchor,constant:widthSpacing),
            creditCardTextField.widthAnchor.constraint(equalToConstant: textFieldslsWidth),
            bioTextField.topAnchor.constraint(equalTo: creditCardLabel.bottomAnchor, constant: heightSpacing),
            bioTextField.leadingAnchor.constraint(equalTo: bioLabel.trailingAnchor, constant: widthSpacing),
            bioTextField.widthAnchor.constraint(equalToConstant: textFieldslsWidth),
            signUpButton.topAnchor.constraint(equalTo: bioTextField.bottomAnchor, constant: heightSpacing),
            signUpButton.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: leadingScreenSpacing),
            signUpButton.widthAnchor.constraint(equalToConstant: buttonsWidth),
            backButton.topAnchor.constraint(equalTo: bioTextField.bottomAnchor, constant: heightSpacing),
            backButton.leadingAnchor.constraint(equalTo: signUpButton.trailingAnchor, constant: widthSpacing),
            backButton.widthAnchor.constraint(equalToConstant: buttonsWidth)
        ])
    }
}
