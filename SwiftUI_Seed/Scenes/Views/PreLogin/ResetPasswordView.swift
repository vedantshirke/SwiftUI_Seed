//
//  ResetPasswordView.swift
//  SwiftUI_Seed
//
//  Created by Vedant Shirke on 01/02/22.
//

import SwiftUI

struct ResetPasswordView: View {
  @Environment(\.presentationMode) var presentationMode
    var body: some View {
        Text("We'll Reset Password here.")
        .onTapGesture {
          presentationMode.wrappedValue.dismiss()
        }
    }
}

struct ResetPasswordView_Previews: PreviewProvider {
    static var previews: some View {
        ResetPasswordView()
    }
}
