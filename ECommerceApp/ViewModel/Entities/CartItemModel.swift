//
//  CartItemModel.swift
//  ECommerceApp
//
//  Created by GGKU5MACBOOKPRO029 on 07/11/24.
//

import Foundation

struct CartItemModel: Identifiable {
    let id: Int
    let image: String
    let title: String
    let price: Double
    var quantity: Int
}
