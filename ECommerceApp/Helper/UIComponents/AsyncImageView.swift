//
//  AsyncImageView.swift
//  ECommerceApp
//
//  Created by GGKU5MACBOOKPRO029 on 07/11/24.
//

import SwiftUI
struct AsyncImageView: View {
    let url: URL
    @StateObject private var viewModel = AsyncImageViewModel()

    var body: some View {
        Group {
            if let image = viewModel.image {
                Image(uiImage: image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            } else {
                ProgressView()
                    .tint(.gray)
            }
        }
        .onAppear {
            viewModel.loadImage(from: url)
        }
    }
}


