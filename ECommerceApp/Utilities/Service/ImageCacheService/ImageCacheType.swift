//
//  ImageCacheType.swift
//  ECommerceApp
//
//  Created by GGKU5MACBOOKPRO029 on 06/11/24.
//

import UIKit

// Declares in-memory image cache
protocol ImageCacheType {
    // Returns the image associated with a given url
    func image(for url: URL) -> UIImage?
    // Inserts the image of the specified url in the cache
    func insertImage(_ image: UIImage?, for url: URL)
    // Removes the image of the specified url in the cache
    func removeImage(for url: URL)
    // Accesses the value associated with the given key for reading and writing
    subscript(_ url: URL) -> UIImage? { get set }
}
