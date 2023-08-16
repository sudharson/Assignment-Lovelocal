//
//  ProductSearchModel.swift
//  Assignment
//
//  Created by Obulisudharson on 14/08/23.
//

import Foundation

struct ProductModel {
    
    var id: Int?
    var title: String?
    var price: Double?
    var image: String?
    var description: String?
    var category: String?
    var rate: Double?
    var count: Int?
    
    static func readFromPersistentStore() -> [ProductModel] {
        var modelArray = [ProductModel]()
        if let products = Product.fetchAllProducts() {
            for product in products {
                var item = ProductModel()
                item.id = Int(product.productId)
                item.description = product.productDescription
                item.title = product.productName
                item.image = product.productImageUrl
                item.price = product.productPrice
                item.category = product.productCategory
                item.count = Int(product.productRatingCount)
                item.rate = product.productRating
                modelArray.append(item)
            }
        }
        return modelArray
    }
    
    static func searchProductsFromPersistentStore(_ queryStr: String?) -> [ProductModel] {
        var modelArray = [ProductModel]()
        if let products = Product.fetchProducts(queryStr ?? "") {
            for product in products {
                var item = ProductModel()
                item.id = Int(product.productId)
                item.description = product.productDescription
                item.title = product.productName
                item.image = product.productImageUrl
                item.price = product.productPrice
                item.category = product.productCategory
                item.count = Int(product.productRatingCount)
                item.rate = product.productRating
                modelArray.append(item)
            }
        }
        return modelArray
    }
}
