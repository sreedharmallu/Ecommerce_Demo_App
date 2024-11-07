//
//  ProductsViewModel.swift
//  ECommerceApp
//
//  Created by GGKU5MACBOOKPRO029 on 07/11/24.
//

import Foundation

class HomeViewModel: ObservableObject {
    @Published var isLoading: Bool = false
    @Published var products: [ProductItem] = []
    
    let categories: [String] = ["iPhone", "consoles", "laptop", "camera"]
    
    @MainActor
    private func getProductItems() {
        Task {
            do {
                isLoading = true
                let decodedProductsList: [ProductsDTO] = try await ApiManager.shared.getData(from: .products)
                DispatchQueue.main.async { [weak self] in
                    self?.products = decodedProductsList.compactMap({$0.toModel()})
                    self?.isLoading = false
                }
            } catch {
                DispatchQueue.main.async {[weak self] in
                    self?.isLoading = false
                }
            }
        }
    }
    
    @MainActor
    func loadProductItems() {
        if products.isEmpty {
            getProductItems()
        }
    }
}

