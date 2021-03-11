//
//  UserInfoPageViewController.swift
//  GBShop
//
//  Created by Зинде Иван on 3/11/21.
//

import UIKit

class UserInfoPageViewController: UIViewController {

    private var userInfoPageView: UserInfoPageView {
        return self.view as! UserInfoPageView
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
        self.view = UserInfoPageView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }

    private func configureUI() {
        self.navigationController?.navigationBar.prefersLargeTitles = true
        userInfoPageView.logoutButton.addTarget(self, action: #selector(logoutButtonAction), for: .touchUpInside)
        userInfoPageView.changeDataButton.addTarget(self,
                                                    action: #selector(changeDataButtonAction),
                                                    for: .touchUpInside)
    }

    @objc func logoutButtonAction(sender: UIButton!) {
        self.dismiss(animated: true)
    }

    @objc func changeDataButtonAction(sender: UIButton!) {
        let changeData = requestFactory.makeChangeUserDataRequestFatory()
        var gender = "m"
        if (userInfoPageView.genderSegmentedControl.selectedSegmentIndex == 1) {
            gender = "f"
        }
        changeData.changeUserData(id: 123,
                      userName: userInfoPageView.usernameTextField.text ?? "",
                      password: userInfoPageView.passwordTextField.text ?? "",
                      email: userInfoPageView.emailTextField.text ?? "",
                      gender: gender,
                      creditCard: userInfoPageView.creditCardTextField.text ?? "",
                      bio: userInfoPageView.bioTextField.text ?? "") { response in
            switch response.result {
            case .success(let changeData):
                guard changeData.result == 1 else { return }
                print(changeData.result)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
