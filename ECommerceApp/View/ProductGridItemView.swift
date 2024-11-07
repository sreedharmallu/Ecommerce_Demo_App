//
//  ProductGridItemView.swift
//  ECommerceApp
//
//  Created by GGKU5MACBOOKPRO029 on 07/11/24.
//

import SwiftUI

struct ProductGridItemView: View {
    @Binding var products: [ProductItem]
    
    let index: Int
    let item: ProductItem
    
    var body: some View {
        VStack {
            ZStack {
                RoundedRectangle(cornerRadius: 16)
                    .fill(Color(EAColor.backgroundColor))
                    .frame(height: 143)
                if let url: URL = URL(string: item.image) {
                    AsyncImageView(url: url)
                        .frame(width: 126, height: 100)
                        .clipShape(RoundedRectangle(cornerRadius: 4))
                        .overlay(alignment: .topTrailing, content: {
                            Image(systemName: item.isFavourite ? EAImage.heartFill : EAImage.heart)
                                .renderingMode(.template)
                                .foregroundStyle(item.isFavourite ? .red : .gray)
                                .bold(true)
                                .scaledToFit()
                                .frame(width: 18, height: 20)
                                .padding(6)
                                .background(Color.white)
                                .clipShape(.circle)
                                .offset(x: 8, y: -8)
                                .onTapGesture(count: 1, perform: {
                                    products[index].isFavourite = !item.isFavourite
                                })
                        })
                } else {
                    Image(EAImage.bagFill)
                        .frame(width: 126, height: 100)
                }
            }
            
            VStack(alignment: .leading, spacing: 16) {
                Text(item.title)
                    .foregroundStyle(.black)
                    .font(.system(size: 14, weight: .semibold))
                    .multilineTextAlignment(.leading)
                HStack(alignment: .firstTextBaseline) {
                    Text("$\(item.price, specifier: "%.2f")")
                        .foregroundStyle(.black)
                        .font(.system(size: 18, weight: .bold))
                    Text("$\(item.price + item.price / 2.0, specifier: "%.2f")")
                        .foregroundStyle(.gray)
                        .font(.system(size: 12, weight: .regular))
                        .strikethrough(color: .gray)
                }
            }
            Spacer()
        }

    }
}
