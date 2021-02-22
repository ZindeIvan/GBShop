//
//  RequestFactoryTests.swift
//  GBShopTests
//
//  Created by Зинде Иван on 2/21/21.
//

import XCTest
@testable import GBShop

class RequestFactoryTests: XCTestCase {
    var requestFactory: RequestFactory!

    override func setUpWithError() throws {
        requestFactory = RequestFactory()
    }

    override func tearDownWithError() throws {
        requestFactory = nil
    }

    func testRequestFactoryAuth() throws {

        let auth = requestFactory.makeAuthRequestFatory()
        let signedIn = expectation(description: "Loged in")
        auth.login(userName: "Somebody", password: "mypassword") { response in
            switch response.result {
            case .success(let login):
                XCTAssertEqual(login.user.id, 123)
                XCTAssertEqual(login.user.login, "geekbrains")
                XCTAssertEqual(login.user.name, "John")
                XCTAssertEqual(login.user.lastname, "Doe")
                signedIn.fulfill()
            case .failure(let error):
                XCTFail(error.localizedDescription)
            }
        }
        
        waitForExpectations(timeout: 10)
    }

    func testRequestFactoryLogout() throws {

        let logout = requestFactory.makeLogoutRequestFatory()
        let logedOut = expectation(description: "Loged out")
        logout.logout(id: 123) { response in
            switch response.result {
            case .success(let logout):
                XCTAssertEqual(logout.result, 1)
                logedOut.fulfill()
            case .failure(let error):
                XCTFail(error.localizedDescription)
            }
        }
        
        waitForExpectations(timeout: 10)
    }

    func testRequestFactorySignUp() throws {

        let signUp = requestFactory.makeSignUpRequestFatory()
        let signedUp = expectation(description: "Signed up")
        signUp.signUp(id: 123, userName: "Somebody", password: "mypassword", email: "some@some.ru", gender: "m", creditCard: "9872389-2424-234224-234", bio: "This is good! I think I will switch to another language") { response in
            switch response.result {
            case .success(let signUp):
                XCTAssertEqual(signUp.result, 1)
                XCTAssertEqual(signUp.userMessage, "Регистрация прошла успешно!")
                signedUp.fulfill()
            case .failure(let error):
                XCTFail(error.localizedDescription)
            }
        }
        
        waitForExpectations(timeout: 10)
    }

    func testRequestFactoryCangeUserData() throws {

        let changeUserData = requestFactory.makeChangeUserDataRequestFatory()
        let cangedUserData = expectation(description: "User data was changed")
        changeUserData.changeUserData(id: 123, userName: "Somebody", password: "mypassword", email: "some@some.ru", gender: "m", creditCard: "9872389-2424-234224-234", bio: "This is good! I think I will switch to another language") { response in
            switch response.result {
            case .success(let changeUserData):
                XCTAssertEqual(changeUserData.result, 1)
                cangedUserData.fulfill()
            case .failure(let error):
                XCTFail(error.localizedDescription)
            }
        }
        
        waitForExpectations(timeout: 10)
    }
    
    func testRequestFactoryGetProductsCatalog() throws {

        let getProductsCatalog = requestFactory.makeGetProductsCatalogRequestFactory()
        let gotProductsCatalog = expectation(description: "Got products catalog")
        getProductsCatalog.getProductsCatalog(pageNumber: 1, categoryId: 1) { response in
            switch response.result {
            case .success(let productsCatalog):
                XCTAssertEqual(productsCatalog.count, 2)
                XCTAssertEqual(productsCatalog[0].id, 123)
                XCTAssertEqual(productsCatalog[0].productName, "Ноутбук")
                XCTAssertEqual(productsCatalog[0].price, 45600)
                XCTAssertEqual(productsCatalog[1].id, 456)
                XCTAssertEqual(productsCatalog[1].productName, "Мышка")
                XCTAssertEqual(productsCatalog[1].price, 1000)
                gotProductsCatalog.fulfill()
            case .failure(let error):
                XCTFail(error.localizedDescription)
            }
        }
        
        waitForExpectations(timeout: 10)
    }
    
    func testRequestFactoryGetProductById() throws {

        let getProductById = requestFactory.makeGetProductByIdRequestFactory()
        let gotProductById = expectation(description: "Got product by id")
        getProductById.getProductById(id: 123) { response in
            switch response.result {
            case .success(let product):
                XCTAssertEqual(product.result, 1)
                XCTAssertEqual(product.productName, "Ноутбук")
                XCTAssertEqual(product.productPrice, 45600)
                XCTAssertEqual(product.productDescription, "Мощный игровой ноутбук")
                gotProductById.fulfill()
            case .failure(let error):
                XCTFail(error.localizedDescription)
            }
        }
        
        waitForExpectations(timeout: 10)
    }

}