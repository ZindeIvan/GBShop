//
//  AbstractErrorParser.swift
//  GBShop
//
//  Created by Зинде Иван on 2/16/21.
//

import Foundation

protocol AbstractErrorParser {
    func parse(_ result: Error) -> Error
    func parse(response: HTTPURLResponse?, data: Data?, error: Error?) -> Error?
}
