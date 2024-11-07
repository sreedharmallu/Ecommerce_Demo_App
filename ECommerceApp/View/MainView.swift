//
//  MainView.swift
//  ECommerceApp
//
//  Created by GGKU5MACBOOKPRO029 on 07/11/24.
//

import SwiftUI
import UIKit

struct MainView: View {
    
    @StateObject private var viewModel = MainViewModel()
    
    init() {
        UITabBar.appearance().backgroundColor = UIColor.white
    }
    
    var body: some View {
        ZStack {
            NavigationStackView()
        }
    }
    
    func NavigationStackView() -> some View {
        NavigationStack {
            TabBarView()
        }
        .environmentObject(viewModel)
    }
    
    func TabBarView() -> some View {
        TabView(selection: $viewModel.selectedTabItem) {
             HomeView()
                .tabItem {
                    Label(TabItem.home.title, systemImage: TabItem.home.imageName)
                }
                .tag(TabItem.home)
            
            CartView()
                .tabItem {
                    Label(TabItem.cart.title, systemImage: TabItem.cart.imageName)
                }
                .badge(viewModel.sum)
                .tag(TabItem.cart)
                
        }
        .tint(Color(EAColor.primaryTintColor))
    }
}

enum TabItem: String, CaseIterable {
    case home
    case cart
    
    var title: String {
        switch self {
        case .home:
            return EAString.home
        case .cart:
            return EAString.home
        }
    }
    
    var imageName: String {
        switch self {
        case .home:
            return EAImage.houseFill
        case .cart:
            return EAImage.cartFill
        }
    }
}
