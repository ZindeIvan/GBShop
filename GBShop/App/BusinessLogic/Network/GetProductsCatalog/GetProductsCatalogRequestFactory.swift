//
//  GetProductsCatalogRequestFactory.swift
//  GBShop
//
//  Created by Зинде Иван on 2/22/21.
//

import Alamofire

protocol GetProductsCatalogRequestFactory {
    func getProductsCatalog(pageNumber: Int, categoryId: Int, completionHandler: @escaping (AFDataResponse<[ProductsCatalogResult]>) -> Void)
}
