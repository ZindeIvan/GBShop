//
//  SignUpViewController.swift
//  GBShop
//
//  Created by Зинде Иван on 3/11/21.
//

import UIKit

class SignUpViewController : UIViewController {

    private var signUpView: SignUpView {
        return self.view as! SignUpView
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
        self.view = SignUpView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }

    private func configureUI() {
        self.navigationController?.navigationBar.prefersLargeTitles = true
        signUpView.signUpButton.addTarget(self, action: #selector(signUpButtonAction), for: .touchUpInside)
        signUpView.backButton.addTarget(self, action: #selector(backButtonAction), for: .touchUpInside)
    }

    @objc func backButtonAction(sender: UIButton!) {
        self.dismiss(animated: true)
    }

    @objc func signUpButtonAction(sender: UIButton!) {
        let signUp = requestFactory.makeSignUpRequestFatory()
        var gender = "m"
        if (signUpView.genderSegmentedControl.selectedSegmentIndex == 1) {
            gender = "f"
        }
        signUp.signUp(id: 123,
                      userName: signUpView.usernameTextField.text ?? "",
                      password: signUpView.passwordTextField.text ?? "",
                      email: signUpView.emailTextField.text ?? "",
                      gender: gender,
                      creditCard: signUpView.creditCardTextField.text ?? "",
                      bio: signUpView.bioTextField.text ?? "") { response in
            switch response.result {
            case .success(let login):
                guard login.result == 1 else { return }
                DispatchQueue.main.async {
                    let userInfoPageViewController = UserInfoPageViewController()
                    userInfoPageViewController.modalPresentationStyle = .fullScreen
                    userInfoPageViewController.modalTransitionStyle = .crossDissolve
                    self.present(userInfoPageViewController, animated: true, completion: nil)
                }
                print(login.result)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
