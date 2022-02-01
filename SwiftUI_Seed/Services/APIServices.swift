//
//  APIServices.swift
//  SwiftUI_Seed
//
//  Created by Vedant Shirke on 01/02/22.
//

import Foundation

class APIServices {
  static let shared = APIServices()
  
  enum APIError: Error {
    case error
  }
  
  func login(
    username: String,
    password: String,
    completion: @escaping(Result<Bool,APIError>) -> Void) {
      
      DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
        if password == "password" && username == "admin" {
          completion(.success(true))
        } else {
          completion(.failure(APIError.error))
        }
      }
      
    }
}
