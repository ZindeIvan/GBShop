//
//  LoginViewController.swift
//  GBShop
//
//  Created by Зинде Иван on 3/11/21.
//

import UIKit

class LoginViewController : UIViewController {

    private lazy var loginView : LoginView = {
        return LoginView()
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
        view = loginView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }

    private func configureUI() {
        navigationController?.navigationBar.prefersLargeTitles = true
        loginView.loginButton.addTarget(self, action: #selector(loginButtonAction), for: .touchUpInside)
        loginView.signUpButton.addTarget(self, action: #selector(signUpButtonAction), for: .touchUpInside)
    }

    @objc func loginButtonAction(sender: UIButton!) {
        let auth = requestFactory.makeAuthRequestFatory()
        auth.login(userName: loginView.loginTextField.text ?? "",
                   password: loginView.passwordTextField.text ?? "") { response in
            switch response.result {
            case .success(let login):
                guard login.result == 1 else { return }
                DispatchQueue.main.async {
                    let tabBarController = TabBarController(requestFactory: self.requestFactory)
                    tabBarController.modalPresentationStyle = .fullScreen
                    tabBarController.modalTransitionStyle = .crossDissolve
                    self.present(tabBarController, animated: true, completion: nil)
                    FBAnalytics.shared.trackLogin(failed: false, error: nil)
                }
            case .failure(let error):
                print(error.localizedDescription)
                FBAnalytics.shared.trackLogin(failed: true, error: error.localizedDescription)
            }
    }
    }

    @objc func signUpButtonAction(sender: UIButton!) {
        let signUpController = SignUpViewController(requestFactory: self.requestFactory)
        signUpController.modalPresentationStyle = .fullScreen
        signUpController.modalTransitionStyle = .crossDissolve
        present(signUpController, animated: true, completion: nil)
    }
}
