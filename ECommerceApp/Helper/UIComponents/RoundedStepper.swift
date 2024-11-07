//
//  StepperView.swift
//  ECommerceApp
//
//  Created by GGKU5MACBOOKPRO029 on 07/11/24.
//

import SwiftUI

struct RoundedStepper: View {
    @Binding var value: Int
    
    var minValue: Int = 0
    var maxValue: Int = 10
    var step: Int = 1
    
    var body: some View {
        HStack(spacing: 8) {
            // Decrement Button
            Button(action: {
                if value > minValue {
                    value -= step
                }
            }) {
                Image(systemName: "minus")
                    .font(.system(size: 12, weight: .bold))
                    .foregroundColor(.black)
                    .frame(width: 20, height: 20)
                    .background(value > minValue ? Color("backgroundColor") : Color.gray)
                    .clipShape(Circle())
            }
            .disabled(value <= minValue)

            // Display the current value
            Text("\(value)")
                .font(.system(size: 12, weight: .bold))
                .frame(width: 30)

            // Increment Button
            Button(action: {
                if value < maxValue {
                    value += step
                }
            }) {
                Image(systemName: "plus")
                    .font(.system(size: 12, weight: .bold))
                    .foregroundColor(.black)
                    .frame(width: 20, height: 20)
                    .background(value < maxValue ? Color("backgroundColor") : Color.gray)
                    .clipShape(Circle())
            }
            .disabled(value >= maxValue)
        }
    }
}


