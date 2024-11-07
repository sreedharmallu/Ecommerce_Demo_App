//
//  AsyncImageViewModel.swift
//  ECommerceApp
//
//  Created by GGKU5MACBOOKPRO029 on 07/11/24.
//
import UIKit
import Combine

final class AsyncImageViewModel: ObservableObject {
    @Published var image: UIImage?
    private var cancellable: AnyCancellable?
    private let imageLoader = ImageLoader()

    func loadImage(from url: URL) {
        cancellable = imageLoader.loadImage(from: url)
            .receive(on: DispatchQueue.main)
            .sink { [weak self] loadedImage in
                DispatchQueue.main.async {
                    self?.image = loadedImage
                }
            }
    }
}
