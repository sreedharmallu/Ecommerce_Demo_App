//
//  CartItemView.swift
//  ECommerceApp
//
//  Created by GGKU5MACBOOKPRO029 on 07/11/24.
//

import SwiftUI

struct CartItemView: View {
    @Binding var cartItem: CartItemModel
    var removeItemFromCart: ((Int) -> Void)?
    
    var body: some View {
        HStack {
            ZStack {
                RoundedRectangle(cornerRadius: 8)
                    .fill(Color(EAColor.backgroundColor))
                    .frame(width: 100)
                if let url = URL(string: cartItem.image) {
                    AsyncImageView(url: url)
                        .scaledToFit()
                        .frame(width: 70, height: 70)
                }
            }
            
            VStack(alignment: .leading) {
                Text(cartItem.title)
                    .font(.system(size: 14, weight: .bold))
                    .foregroundStyle(.black)
                    .multilineTextAlignment(.leading)
                Spacer()
                HStack {
                    Text("$\(cartItem.price, specifier: "%.2f")")
                        .font(.system(size: 14, weight: .bold))
                        .foregroundStyle(.black)
                    Spacer()
                    RoundedStepper(value: $cartItem.quantity,
                                   minValue: 0,
                                   maxValue: 100,
                                   step: 1)
                }
            }.padding(10)
        }.frame(height: 100)
            .onChange(of: cartItem.quantity) { oldvalue, NewValue in
                if NewValue == 0 || oldvalue == 0 {
                    removeItemFromCart?(cartItem.id)
                }
            }
    }
}

