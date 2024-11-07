//
//  ProductsDTO.swift
//  ECommerceApp
//
//  Created by GGKU5MACBOOKPRO029 on 07/11/24.
//

import Foundation

struct ProductsDTO: Codable {
    
    let id: Int?
    let title: String?
    let price: Double?
    let description: String?
    let category: String?
    let image: String?
    let rating: ItemRatingDTO?
    
    struct ItemRatingDTO: Codable {
        let rate: Double?
        let count: Int?
    }
    
    func toModel() -> ProductItem? {
        guard let id, let title, let price, let description, let image else { return nil }
        return .init(id: id,
                     title: title,
                     price: price,
                     description: description,
                     image: image,
                     isFavourite: false,
                     rate: rating?.rate,
                     reviewsCount: rating?.count)
    }
    
}
