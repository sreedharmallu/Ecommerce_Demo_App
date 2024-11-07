//
//  MainViewModel.swift
//  ECommerceApp
//
//  Created by GGKU5MACBOOKPRO029 on 07/11/24.
//

import Foundation

class MainViewModel: ObservableObject {
    @Published var cartItems: [CartItemModel] = []
    @Published var selectedTabItem: TabItem = .home
   
    var sum: Int {
        cartItems.reduce(0, { value, item in
            return value + item.quantity
        })
    }
}
