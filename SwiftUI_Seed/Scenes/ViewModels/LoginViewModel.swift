//
//  LoginViewModel.swift
//  SwiftUI_Seed
//
//  Created by Vedant Shirke on 01/02/22.
//

import Foundation

class LoginViewModel: ObservableObject {
  @Published var username: String = ""
  @Published var password: String = ""
  @Published var isPasswordResetShown: Bool = false
  @Published var showProgressView: Bool = false
  
  var loginDisabled: Bool {
    username.isEmpty || password.isEmpty
  }
  
  func login(completionHandler: @escaping (Bool) -> Void) {
    showProgressView = true
    APIServices.shared.login(username: username, password: password) { [weak self] (result: Result<Bool, APIServices.APIError>) in
      guard let self = self else { return }
      self.showProgressView = false
      switch result {
        case .success:
          completionHandler(true)
        case .failure:
          self.username = ""
          self.password = ""
          completionHandler(false)
      }
    }
  }
}
