//
//  ProductItemDetailView.swift
//  ECommerceApp
//
//  Created by GGKU5MACBOOKPRO029 on 07/11/24.
//

import SwiftUI

struct ProductItemDetailView: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var mainViewModel: MainViewModel
    @Binding var item: ProductItem
    
    var body: some View {
        ZStack {
            ZStack {
                VStack {
                    if let imageUrl = URL(string: item.image) {
                        AsyncImageView(url: imageUrl)
                            .frame(maxHeight: UIScreen.main.bounds.height * 0.3)
                    }
                    
                    ProductInformationView()
                }.frame(maxWidth: .infinity)
            }.background(Color(EAColor.backgroundColor))
        }
        .navigationBarBackButtonHidden()
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }, label: {
                    Image(systemName: EAImage.backIcon)
                        .resizable()
                        .renderingMode(.template)
                        .foregroundStyle(.black)
                        .frame(width: 15, height: 15)
                        .frame(width: 45, height: 45)
                        .background(Color.white)
                        .clipShape(.circle)
                })
            }
            
            ToolbarItem(placement: .topBarTrailing) {
                Button(action: {
                    item.isFavourite = !item.isFavourite
                }, label: {
                    Image(systemName: item.isFavourite ? EAImage.heartFill : EAImage.heart)
                        .renderingMode(.template)
                        .foregroundStyle(item.isFavourite ? .red : .gray)
                        .bold(true)
                        .scaledToFit()
                        .frame(width: 45, height: 45)
                        .padding(6)
                        .background(Color.white)
                        .clipShape(.circle)
                })
            }
        }
    }
    
    private func ProductInformationView() -> some View {
        ZStack {
            RoundedRectangle(cornerRadius: 24)
                .fill(Color.white)
                .ignoresSafeArea(edges: .bottom)
            
            VStack {
                ItemInfoView()
                
                AddToCartButtonAndLabel()
            }
        }
    }
    
    @ViewBuilder
    private func AddToCartButtonAndLabel() -> some View {
        Button(action: addingItemInCart, label: {
            Text(EAString.addToCart)
                .font(.system(size: 16, weight: .semibold))
                .foregroundStyle(.black)
                .frame(maxWidth: .infinity)
                .frame(height: 45)
                .background(Color(EAColor.primaryTintColor))
                .clipShape(RoundedRectangle(cornerRadius: 8))
        }).padding(.horizontal, 20)
        
        Text(EAString.deliveryDate)
            .font(.system(size: 14, weight: .semibold))
            .foregroundStyle(.black)
    }
    
    private func addingItemInCart() {
        if let index = mainViewModel.cartItems.lastIndex(where: {$0.id == item.id}) {
            mainViewModel.cartItems[index].quantity += 1
        } else {
            mainViewModel
                .cartItems
                .append(.init(id: item.id, image: item.image, title: item.title, price: item.price, quantity: 1))
        }
    }
    
    private func ItemInfoView() -> some View {
        ScrollView(.vertical) {
            VStack(alignment: .leading) {
                TitleView()
                
                if let rate = item.rate {
                    RatingView(rate: rate)
                }
                
                ItemPriceView()
                
                ExpandableText(item.description,
                               lineLimit: 3,
                               font: .systemFont(ofSize: 14, weight: .semibold))
                    .foregroundStyle(.gray)
                
            }.padding(.top, 20)
                .padding(.horizontal, 20)
        }
    }
    
    private func TitleView() -> some View {
        Text(item.title)
            .font(.system(size: 22, weight: .heavy))
            .foregroundStyle(.black)
            .multilineTextAlignment(.leading)
    }
    
    private func RatingView(rate: Double) -> some View {
        HStack {
            Image(systemName: EAImage.startFill)
                .resizable()
                .renderingMode(.template)
                .frame(width: 24, height: 24)
                .foregroundColor(Color(EAColor.secondaryColor))
            Text("\(rate, specifier: "%.1f")")
                .foregroundStyle(.black)
                .font(.system(size: 14, weight: .bold))
            
            if let count = item.reviewsCount {
                Text("\(count) \(count != 1 ? "reviews" : "review")")
                    .font(.system(size: 12, weight: .semibold))
                    .foregroundStyle(.gray)
            }
        }
        .padding(.horizontal, 12)
        .padding(.vertical, 4)
        .background(Color.white)
        .cornerRadius(4)
        .padding(2)
        .background(Color.gray)
        .cornerRadius(5)
    }
    
    private func ItemPriceView() -> some View {
        HStack {
            Text("$\(item.price, specifier: "%.2f") ")
                .foregroundStyle(.black)
                .font(.system(size: 16, weight: .bold))
            +
            Text(EAString.staticItemPricePerMonth)
                .foregroundStyle(.gray)
                .font(.system(size: 12, weight: .semibold))
            
            Spacer()
            
            Image(systemName: EAImage.infoCircle)
                .resizable()
                .renderingMode(.template)
                .frame(width: 24, height: 24)
                .foregroundStyle(.gray)
        }
        .padding(.horizontal, 20)
        .frame(height: 46)
        .background(Color(EAColor.backgroundColor))
        .clipShape(RoundedRectangle(cornerRadius: 8))
    }
}
