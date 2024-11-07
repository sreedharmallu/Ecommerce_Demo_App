//
//  CartView.swift
//  ECommerceApp
//
//  Created by GGKU5MACBOOKPRO029 on 07/11/24.
//

import SwiftUI

struct CartView: View {
    @EnvironmentObject private var mainViewModel: MainViewModel
    
    @StateObject private var viewModel = CartViewModel()
    
    private var totalCost: Double {
        mainViewModel.cartItems.reduce(0, { value, item in
            return value + (item.price * Double(item.quantity))
        })
    }
    
    var body: some View {
        VStack {
            MainView()
            
            CheckoutButtonAndTotalCostView()
            
        }
        .ignoresSafeArea(edges: .top)
        .alert(EAString.checkoutAlertTitle, isPresented: $viewModel.showAlert, actions: {
            Button(action: {
                mainViewModel.cartItems = []
            }, label: {
                Text(EAString.ok)
            })
        }, message: {
            Text(EAString.thankYou)
        })
    }
    
    func MainView() -> some View {
        ScrollView(.vertical) {
            VStack(spacing: 20) {
                //MARK: Top View
                TopView()
                
                //MARK: Bottom View
                CartContentView()
            }
        }
        .background(Color(EAColor.backgroundColor))
    }
    
    private func CartContentView() -> some View {
        VStack(alignment: .leading) {
            if mainViewModel.cartItems.isEmpty {
                Text(EAString.emptyCartItemsText)
                    .font(.system(size: 24, weight: .bold))
                    .foregroundStyle(.black)
                    .frame(maxHeight: .infinity)
            } else {
                Text(EAString.cartItemsAddText)
                    .font(.system(size: 20, weight: .bold))
                    .foregroundStyle(.black)
                    .padding(20)
                VStack(spacing: 12) {
                    ForEach(Array(mainViewModel.cartItems.enumerated()), id: \.offset) { index, cartItem in
                        CartItemView(cartItem: $mainViewModel.cartItems[index]) { id in
                            mainViewModel
                                .cartItems
                                .removeAll(where: {$0.id == id && $0.quantity == 0})
                        }
                    }
                }
            }
        }
        .padding(20)
        .frame(maxWidth: .infinity, minHeight: UIScreen.main.bounds.height * 0.6, alignment: .top)
            .background(Color.white)
    }
    
    func TopView() -> some View {
        VStack(spacing: 12) {
            TopNavigationBarView()
            
            UserLocationView()
            
        }
        .padding(.top, UIDevice.current.hasNotch ? UIDevice.current.topSafeArea : 0)
        .padding([.leading, .trailing, .bottom], 20)
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 22))
    }
    
    private func TopNavigationBarView() -> some View {
        HStack {
            Text(EAString.cart)
                .font(.system(size: 28, weight: .heavy))
                .foregroundStyle(.black)
            
            Spacer()
            
            Image(systemName: EAImage.ellipsis)
                .frame(width: 24, height: 24)
                .padding(12)
                .background(Color(EAColor.backgroundColor))
                .clipShape(.circle)
            
        }
    }
    
    private func UserLocationView() -> some View {
        HStack {
            Image(systemName: EAImage.location)
                .renderingMode(.template)
                .foregroundStyle(.gray)
            Text(EAString.staticUserLocation)
                .font(.system(size: 16, weight: .semibold))
                .foregroundStyle(.black)
        }
        .padding(.horizontal, 20)
        .frame(maxWidth: .infinity, alignment: .leading)
            .frame(height: 50)
            .background(Color(EAColor.backgroundColor))
            .cornerRadius(10)
    }
    
    @ViewBuilder
    private func CheckoutButtonAndTotalCostView() -> some View {
        if mainViewModel.cartItems.count != 0 {
            Text("Total Cost: $\(totalCost, specifier: "%.2f")")
                .font(.system(size: 24, weight: .black))
                .foregroundStyle(.black)
                .frame(maxWidth: .infinity, alignment: .trailing)
                .padding(20)
            
            Button(action: {
                viewModel.showAlert.toggle()
            }, label: {
                Text(EAString.checkout)
                    .font(.system(size: 16, weight: .semibold))
                    .foregroundStyle(.black)
                    .frame(maxWidth: .infinity)
                    .frame(height: 45)
                    .background(Color(EAColor.primaryTintColor))
                    .clipShape(RoundedRectangle(cornerRadius: 8))
            }).padding(.horizontal, 20)
        }
    }
}

#Preview {
    CartView()
}


