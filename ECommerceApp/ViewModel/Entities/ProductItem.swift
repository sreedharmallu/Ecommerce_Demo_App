//
//  ProductItem.swift
//  ECommerceApp
//
//  Created by GGKU5MACBOOKPRO029 on 07/11/24.
//

import Foundation

struct ProductItem: Identifiable {
    let id: Int
    let title: String
    let price: Double
    let description: String
    let image: String
    var isFavourite: Bool
    let rate: Double?
    let reviewsCount: Int?
}
