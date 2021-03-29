//
//  GBShopUITests.swift
//  GBShopUITests
//
//  Created by Зинде Иван on 2/13/21.
//

import XCTest

class GBShopUITests: XCTestCase {

    override func setUpWithError() throws {
        continueAfterFailure = false

    }

    override func tearDownWithError() throws {

    }

    func testLogin() throws {
        let app = XCUIApplication()
        app.launch()

        let usernameTextField = app.textFields["Login"]
        usernameTextField.tap()
        usernameTextField.typeText("Somebody")

        let passwordTextField = app.textFields["Password"]
        passwordTextField.tap()
        passwordTextField.typeText("mypassword")

        let button = app.buttons["Login"].firstMatch
        XCTAssertTrue(button.isHittable, "\(app.debugDescription)")

        button.tap()

        let productsView = app.otherElements["ProductsCatalog"].firstMatch
        XCTAssertTrue(productsView.waitForExistence(timeout: 3))
    }
}
