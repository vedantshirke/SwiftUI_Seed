//
//  UserPreferences.swift
//  SwiftUI_Seed
//
//  Created by Vedant Shirke on 01/02/22.
//

import Foundation

class UserPreferences {
    var isAuthenticated: Bool {
        get {
            UserDefaults.standard.bool(forKey: "IS_AUTHENTICATED")
        }
        set {
            UserDefaults.standard.set(newValue, forKey: "IS_AUTHENTICATED")
        }
    }
}
