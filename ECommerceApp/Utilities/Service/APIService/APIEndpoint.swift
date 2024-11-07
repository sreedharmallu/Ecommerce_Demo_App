//
//  APIEndpoint.swift
//  ECommerceApp
//
//  Created by GGKU5MACBOOKPRO029 on 06/11/24.
//

import Foundation

enum ApiEndpoint {

    /// Define here your all the endpoints

    case products
}

extension ApiEndpoint {
    enum Method: String {
       case GET
       case POST
       case PUT
       case DELETE
    }
}

extension ApiEndpoint {
        
   /// The path for every endpoint
   var path: String {
      switch self {
          
      case .products:
          "/products"
      }
   }
    
   /// The method for the endpoint
   var method: ApiEndpoint.Method {
      switch self {
      case .products:
          return .GET
      }
   }

   /// The query parameters for the endpoint (in case it has any)
   var parameters: [URLQueryItem]? {
      switch self {
      default:
         return nil
      }
   }
}
