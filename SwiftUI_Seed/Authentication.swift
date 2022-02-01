//
//  Authentication.swift
//  SwiftUI_Seed
//
//  Created by Vedant Shirke on 01/02/22.
//

import SwiftUI

class Authentication: ObservableObject {
  @Published var isValidated: Bool = false
  
  func updateValidation(success: Bool) {
    withAnimation {
      UserPreferences().isAuthenticated = true
      isValidated = success
    }
  }
}
