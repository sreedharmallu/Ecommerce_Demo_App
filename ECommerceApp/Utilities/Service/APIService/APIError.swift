//
//  APIError.swift
//  ECommerceApp
//
//  Created by GGKU5MACBOOKPRO029 on 06/11/24.
//

import Foundation

enum ApiError: Error {
   case invalidPath
   case decoding
}

extension ApiError {
   var localizedDescription: String {
      switch self {
      case .invalidPath:
         return "Invalid Path"
      case .decoding:
         return "There was an error decoding the type"
      }
   }
}
