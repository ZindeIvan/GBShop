//
//  UserInfoPageViewController.swift
//  GBShop
//
//  Created by Зинде Иван on 3/11/21.
//

import UIKit

class UserInfoPageViewController: UIViewController {

    private lazy var userInfoPageView: UserInfoPageView = {
        return UserInfoPageView()
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
        view = userInfoPageView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }

    private func configureUI() {
        navigationController?.navigationBar.prefersLargeTitles = true
        userInfoPageView.logoutButton.addTarget(self, action: #selector(logoutButtonAction), for: .touchUpInside)
        userInfoPageView.changeDataButton.addTarget(self,
                                                    action: #selector(changeDataButtonAction),
                                                    for: .touchUpInside)
    }

    private func getGender() -> String {
        var gender = "m"
        if (userInfoPageView.genderSegmentedControl.selectedSegmentIndex == 1) {
            gender = "f"
        }
        return gender
    }

    @objc func logoutButtonAction(sender: UIButton!) {
        let logout = requestFactory.makeLogoutRequestFatory()
        logout.logout(id: 123) { (response) in
            switch response.result {
            case .success(let changeData):
                guard changeData.result == 1 else { return }
                print(changeData.result)
                DispatchQueue.main.async {
                    self.dismiss(animated: true)
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }

    @objc func changeDataButtonAction(sender: UIButton!) {
        let changeData = requestFactory.makeChangeUserDataRequestFatory()
        changeData.changeUserData(id: 123,
                      userName: userInfoPageView.usernameTextField.text ?? "",
                      password: userInfoPageView.passwordTextField.text ?? "",
                      email: userInfoPageView.emailTextField.text ?? "",
                      gender: getGender(),
                      creditCard: userInfoPageView.creditCardTextField.text ?? "",
                      bio: userInfoPageView.bioTextField.text ?? "") { response in
            switch response.result {
            case .success(let changeData):
                guard changeData.result == 1 else { return }
                print("Data was chanched")
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
