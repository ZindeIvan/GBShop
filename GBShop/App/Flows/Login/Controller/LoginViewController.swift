//
//  LoginViewController.swift
//  GBShop
//
//  Created by Зинде Иван on 3/11/21.
//

import UIKit

class LoginViewController : UIViewController {

    private var loginView: LoginView {
        return self.view as! LoginView
    }

    private var  requestFactory = RequestFactory(
        baseURL: "https://infinite-depths-93698.herokuapp.com/")

    init() {
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        self.view = LoginView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }

    private func configureUI() {
        self.navigationController?.navigationBar.prefersLargeTitles = true
        loginView.loginButton.addTarget(self, action: #selector(loginButtonAction), for: .touchUpInside)
        loginView.signUpButton.addTarget(self, action: #selector(signUpButtonAction), for: .touchUpInside)
    }

    @objc func loginButtonAction(sender: UIButton!) {
        let auth = requestFactory.makeAuthRequestFatory()
        auth.login(userName: "Somebody", password: "mypassword") { response in
            switch response.result {
            case .success(let login):
                guard login.result == 1 else { return }
                DispatchQueue.main.async {
                    let userInfoController = UserInfoPageViewController()
                    userInfoController.modalPresentationStyle = .fullScreen
                    userInfoController.modalTransitionStyle = .crossDissolve
                    self.present(userInfoController, animated: true, completion: nil)
                }
                print(login.result)
            case .failure(let error):
                print(error.localizedDescription)
            }
    }
    }

    @objc func signUpButtonAction(sender: UIButton!) {
        let signUpController = SignUpViewController()
        signUpController.modalPresentationStyle = .fullScreen
        signUpController.modalTransitionStyle = .crossDissolve
        present(signUpController, animated: true, completion: nil)
    }
}
