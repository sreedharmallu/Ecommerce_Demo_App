//
//  UIDevice+Extension.swift
//  ECommerceApp
//
//  Created by GGKU5MACBOOKPRO029 on 06/11/24.
//

import UIKit

extension UIDevice {
    private var safeAreaInsets: UIEdgeInsets? { UIApplication.shared.keyWindow?.safeAreaInsets
    }
    
    var hasNotch: Bool {
        bottomSafeArea > 0
    }
    
    var topSafeArea: CGFloat {
        safeAreaInsets?.top ?? 0
    }
    
    var bottomSafeArea: CGFloat {
        safeAreaInsets?.bottom ?? 0
    }
}
