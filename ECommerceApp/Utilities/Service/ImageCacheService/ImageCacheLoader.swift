//
//  ImageCacheLoader.swift
//  ECommerceApp
//
//  Created by GGKU5MACBOOKPRO029 on 06/11/24.
//

import UIKit
import Combine

final class ImageLoader {

    private let cache = ImageCache()
    private let backgroundQueue = DispatchQueue(label: "background", qos: .background)

    func loadImage(from url: URL) -> AnyPublisher<UIImage?, Never> {
        if let image = cache[url] {
            return Just(image).eraseToAnyPublisher()
        }
        return URLSession.shared.dataTaskPublisher(for: url)
            .map { (data, response) -> UIImage? in return UIImage(data: data) }
            .catch { error in return Just(nil) }
            .handleEvents(receiveOutput: {[unowned self] image in
                guard let image = image else { return }
                self.cache[url] = image
            })
            .subscribe(on: backgroundQueue)
            .receive(on: RunLoop.main)
            .eraseToAnyPublisher()
    }
}
