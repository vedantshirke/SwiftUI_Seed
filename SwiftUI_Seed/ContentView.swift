//
//  ContentView.swift
//  SwiftUI_Seed
//
//  Created by Vedant Shirke on 31/01/22.
//

import SwiftUI

struct ContentView: View {
  @EnvironmentObject var authentication: Authentication
    var body: some View {
      ListView()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
