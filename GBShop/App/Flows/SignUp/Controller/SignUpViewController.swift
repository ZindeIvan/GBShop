//
//  SignUpViewController.swift
//  GBShop
//
//  Created by Зинде Иван on 3/11/21.
//

import UIKit

class SignUpViewController : UIViewController {

    private lazy var signUpView: SignUpView = {
        return SignUpView()
    }()

    private var requestFactory : RequestFactory

    init(requestFactory: RequestFactory) {
        self.requestFactory = requestFactory
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        view = signUpView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }

    private func configureUI() {
        navigationController?.navigationBar.prefersLargeTitles = true
        signUpView.signUpButton.addTarget(self, action: #selector(signUpButtonAction), for: .touchUpInside)
        signUpView.backButton.addTarget(self, action: #selector(backButtonAction), for: .touchUpInside)
    }

    private func getGender() -> String {
        var gender = "m"
        if (signUpView.genderSegmentedControl.selectedSegmentIndex == 1) {
            gender = "f"
        }
        return gender
    }

    @objc func backButtonAction(sender: UIButton!) {
        dismiss(animated: true)
    }

    @objc func signUpButtonAction(sender: UIButton!) {
        let signUp = requestFactory.makeSignUpRequestFatory()

        signUp.signUp(id: 123,
                      userName: signUpView.usernameTextField.text ?? "",
                      password: signUpView.passwordTextField.text ?? "",
                      email: signUpView.emailTextField.text ?? "",
                      gender: getGender(),
                      creditCard: signUpView.creditCardTextField.text ?? "",
                      bio: signUpView.bioTextField.text ?? "") { response in
            switch response.result {
            case .success(let login):
                guard login.result == 1 else { return }
                print(login.userMessage)
                DispatchQueue.main.async {
                    self.dismiss(animated: true, completion: nil)
                    FBAnalytics.shared.trackSignUp(failed: false, error: nil)
                }
            case .failure(let error):
                FBAnalytics.shared.trackSignUp(failed: true, error: error.localizedDescription)
            }
        }
    }
}
