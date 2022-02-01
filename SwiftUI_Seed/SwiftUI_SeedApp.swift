//
//  SwiftUI_SeedApp.swift
//  SwiftUI_Seed
//
//  Created by Vedant Shirke on 31/01/22.
//

import SwiftUI

@main
struct SwiftUI_SeedApp: App {
  @StateObject var authentication = Authentication()
    var body: some Scene {
        WindowGroup {
          if authentication.isValidated {
            ContentView()
              .environmentObject(authentication)
          } else {
            LoginView()
              .environmentObject(authentication)
          }
        }
    }
}
