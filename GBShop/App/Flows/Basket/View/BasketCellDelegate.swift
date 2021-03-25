//
//  BasketCellDelegate.swift
//  GBShop
//
//  Created by Зинде Иван on 3/25/21.
//

import Foundation

protocol BasketCellDelegate : AnyObject {
    func countValueChanged(index: Int, count: Int)

    func deleteButtonTapped(index: Int)
}
