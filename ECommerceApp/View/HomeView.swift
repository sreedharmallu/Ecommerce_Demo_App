//
//  HomeView.swift
//  ECommerceApp
//
//  Created by GGKU5MACBOOKPRO029 on 07/11/24.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var mainViewModel: MainViewModel
    
    @State private var searchText: String = EAString.emptyString
    @StateObject private var viewModel = HomeViewModel()
    
    var body: some View {
        MainView()
    }
    
    private func MainView() -> some View {
        ScrollView(.vertical) {
            VStack(spacing: 20) {
                //MARK: TOP Navigation Bar
                TopNavigationBarView()
                
                //MARK: Categories & Items
                ItemsGridView()
            }
        }.background(Color(EAColor.backgroundColor))
            .scrollDismissesKeyboard(.interactively)
            .ignoresSafeArea(edges: .top)
            .onAppear(perform: viewModel.loadProductItems)
    }
    
    
    
    private func TopNavigationBarView() -> some View {
        VStack(spacing: 12) {
            DiscountAndCartDisplayView()
            
            SearchBarView()
            
            DiscountToastLabelView()
        }
        .padding(.top, UIDevice.current.hasNotch ? UIDevice.current.topSafeArea : 0)
        .padding([.leading, .trailing, .bottom], 20)
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 22))
    }
    
    private func DiscountAndCartDisplayView() -> some View {
        HStack {
            DiscountIconView()
            Spacer()
            
            UserDeliveryAddressView()
            
            Spacer()
            
            CartButtonView()
        }
    }
    
    private func DiscountIconView() -> some View {
        Image(EAImage.discount)
            .resizable()
            .renderingMode(.template)
            .fontWeight(.semibold)
            .frame(width: 24, height: 24)
            .padding(12)
            .background(Color(EAColor.primaryTintColor))
            .clipShape(.circle)
    }
    
    private func UserDeliveryAddressView() -> some View {
        VStack(spacing: 5) {
            Text(EAString.deliveryAddress)
                .foregroundStyle(.gray)
                .font(.system(size: 13, weight: .semibold))
            Text(EAString.staticUserLocation)
                .foregroundStyle(.black)
                .font(.system(size: 18, weight: .semibold))
        }
    }
    
    private func CartButtonView() -> some View {
        Button(action: {
            mainViewModel.selectedTabItem = .cart
        }, label: {
            Image(systemName: TabItem.cart.rawValue)
                .resizable()
                .foregroundStyle(.black)
                .frame(width: 24, height: 24)
                .padding(12)
                .background(Color(EAColor.backgroundColor))
                .clipShape(.circle)
        })
        .customBadge(mainViewModel.sum, maxCountAmount: 10)
    }
    
    private func SearchBarView() -> some View {
        TextField(EAString.searchPlaceholderText, text: $searchText)
            .padding(8)
            .background(Color(EAColor.backgroundColor))
            .clipShape(RoundedRectangle(cornerRadius: 8))
    }
    
    private func DiscountToastLabelView() -> some View {
        ZStack(alignment: .leading) {
            RoundedRectangle(cornerRadius: 12)
                .fill(LinearGradient(colors: [Color(.tertiaryLeading), Color(.tertiaryTrailing), Color(.tertiaryTrailing), Color(.tertiaryTrailing)], startPoint: .leading, endPoint: .trailing))
                .frame(height: 50)
            HStack {
                Text(EAString.delivery)
                
                Text(EAString.fiftyPercent)
                    .padding(.horizontal, 8)
                    .padding(.vertical, 3)
                    .background(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 4))
                Text(EAString.cheaper)
            }.padding(.leading, 20)
                .font(.system(size: 14, weight: .bold))
            
        }
    }
    
    private func ItemsGridView() -> some View {
        VStack(spacing: 20) {
            ///Categories
            CategoriesView()
            
            ///Items
            FlashItemsView()
            
        }.background(Color.white)
    }
    
    private func CategoriesView() -> some View {
        VStack(alignment: .leading) {
            Text("Categories")
                .foregroundStyle(.black)
                .font(.system(size: 22, weight: .heavy))
                .padding(.leading, 20)
            
            CategoriesGridView()
        }
        
        .padding(.top, 20)
    }
    
    private func CategoriesGridView() -> some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHGrid(rows: [.init(.fixed(75))], spacing: 0) {
                ForEach(viewModel.categories, id: \.self) { item in
                    ZStack {
                        Circle()
                            .fill(Color("backgroundColor"))
                        Image(item)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 50, height: 50)
                    }
                    .padding(.leading, 20)
                }
            }
        }
    }
    
    
    private func FlashItemsView() -> some View {
        VStack(alignment: .leading) {
            HStack(spacing: 18) {
                Text(EAString.flashSale)
                    .foregroundStyle(.black)
                    .font(.system(size: 22, weight: .heavy))
                Text(EAString.flashSaleTimeOut)
                    .font(.system(size: 12, weight: .bold))
                    .foregroundStyle(.black)
                    .padding(.horizontal, 8)
                    .padding(.vertical, 4)
                    .background(Color(EAColor.primaryTintColor))
                    .clipShape(RoundedRectangle(cornerRadius: 4))
            }
            
            FlashSaleView()
        }.padding(.bottom, UIDevice.current.hasNotch ? UIDevice.current.bottomSafeArea : 0)
            .padding(.horizontal, 20)
    }
    
    private func FlashSaleView() -> some View {
        ScrollView(.vertical) {
            if viewModel.products.isEmpty {
                FlashSaleEmptyView()
            } else {
                FlashSaleItemsView()
            }
        }
    }
    
    @ViewBuilder
    private func FlashSaleEmptyView() -> some View {
        if viewModel.isLoading {
            Text(EAString.loadingText)
                .font(.system(size: 16, weight: .semibold))
                .foregroundStyle(.gray)
        } else {
            Text(EAString.emptyFlashSaleText)
                .font(.system(size: 22, weight: .bold))
                .foregroundStyle(.black)
        }
    }
    
    private func FlashSaleItemsView() -> some View {
        LazyVGrid(columns: [.init(.adaptive(minimum: 150, maximum: 165), spacing: 20)], spacing: 20) {
            ForEach(Array(viewModel.products.enumerated()), id: \.offset) { index, item in
                NavigationLink(destination: ProductItemDetailView(item: $viewModel.products[index]), label: {
                    ProductGridItemView(products: $viewModel.products,
                                        index: index,
                                        item: item)
                })
            }
        }
    }
}


