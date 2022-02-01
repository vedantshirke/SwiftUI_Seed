  //
  //  LoginView.swift
  //  SwiftUI_Seed
  //
  //  Created by Vedant Shirke on 01/02/22.
  //

  import SwiftUI

  struct LoginView: View {
    
    @EnvironmentObject var authentication: Authentication
    @StateObject var viewModel: LoginViewModel = LoginViewModel()

    var body: some View {
        ZStack {
            VStack {
                Image(systemName: "multiply.circle.fill")
                    .frame( width: 150, height: 150)
                    .background(Color.white)
                    .foregroundColor(Color.black)
                    .padding(50)
                    .shadow(color: Color.black, radius: 20, x: 0, y: 0)
                Text("Login")
                    .font(.system(size: 30, weight: .bold))
                    .foregroundColor(Color.white)
                loginForm
              if viewModel.showProgressView {
                ProgressView()
              }
                Spacer()
            }
        }
        .background(Color.gray)
        .ignoresSafeArea()
    }
    
    var loginForm: some View {
        ZStack {
            VStack {
                Text("Login Form Goes here.")
                    .foregroundColor(Color.black)
                buildUsernameTextField
                buildPasswordTextField
                resetPasswordStack
                loginButton
                Spacer()
            }
        }
        .background(Color.white)
    }
    
    var buildUsernameTextField: some View {
        VStack {
            Text("Username : ")
                .font(.system(size: 15, weight: .semibold))
                .foregroundColor(Color.gray)
                .fontWeight(.semibold)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(EdgeInsets.init(top: 5, leading: 20, bottom: 0, trailing: 20))
            TextField(LocalizedStringKey.init("Username"), text: $viewModel.username, prompt: nil)
                .padding(EdgeInsets.init(top: 3, leading: 20, bottom: 5, trailing: 20))
                .textFieldStyle(.roundedBorder)
        }
    }
    
    var buildPasswordTextField: some View {
        VStack {
            Text("Password : ")
                .font(.system(size: 15, weight: .semibold))
                .foregroundColor(Color.gray)
                .fontWeight(.semibold)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(EdgeInsets.init(top: 5, leading: 20, bottom: 0, trailing: 20))
            SecureField(LocalizedStringKey.init("Password"), text: $viewModel.password, prompt: nil)
                .padding(EdgeInsets.init(top: 3, leading: 20, bottom: 5, trailing: 20))
                .textFieldStyle(.roundedBorder)
        }
    }
    
    var loginButton: some View {
        Button {
          viewModel.login { success in
            authentication.updateValidation(success: success)
          }
        } label: {
            Text("Login")
                .font(.system(size: 20, weight: .semibold))
                .frame(maxWidth: .infinity, maxHeight: 50)
                .foregroundColor(Color.white)
                .background(Color.gray)
                .shadow(color: Color.gray, radius: 20, x: 0, y: 0)
                .cornerRadius(5)
        }
        .frame(maxWidth: .infinity)
        .disabled(viewModel.loginDisabled)
        .padding(EdgeInsets.init(top: 5, leading: 20, bottom: 5, trailing: 20))
    }
    
    var resetPasswordStack: some View {
        HStack{
            Button {
                print("Forgot password here.")
            } label: {
                Text("Forgot password?")
                    .font(.system(size: 15, weight: .semibold))
            }
            Spacer()
            Button {
              viewModel.isPasswordResetShown.toggle()
            } label: {
                Text("Reset password.")
                    .font(.system(size: 15, weight: .semibold))
            }
            .fullScreenCover(isPresented: $viewModel.isPasswordResetShown, content: ResetPasswordView.init)
        }
        .padding(EdgeInsets.init(top: 3, leading: 20, bottom: 5, trailing: 20))
    }
  }

  struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
  }
