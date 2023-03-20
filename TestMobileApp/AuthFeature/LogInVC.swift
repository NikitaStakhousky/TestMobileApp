//
//  LogInVC.swift
//  TestMobileApp
//
//  Created by Nikita Stshovsky on 15.03.23.
//

import SwiftUI

struct LogInVC: View {

  @EnvironmentObject private var viewModel: AuthViewModel
  @State var email = ""
  @State var password = ""
  @State var showHidePassword = false
  @State var alert = false
  @State var message = ""
  @Binding var show: Bool

  var body: some View {
    VStack {
      Text("Welcome Back")
        .font(.system(size: 24, weight: .semibold))
        .padding(.bottom, 80)
      logInTextFields()
        .padding(.bottom, 100)
      RoundedButton(action: {
        AuthService.shared.signIn(email: email, password: password) { result in
          switch result {
          case .success(let success):
            print("succes login")
          case .failure(let failure):
            if !viewModel.textFieldValidatorEmail(email) {
              message = "email address entered incorrectly"
            } else {
              message = "incorrect data \(failure.localizedDescription)"
            }
            alert.toggle()
          }
        }
      }, text: "Log In")
    }
    .alert(isPresented: $alert) {
      Alert(title: Text("Error"), message: Text(self.message), dismissButton: .default(Text("Ok")))
    }
  }

  private func logInTextFields() -> some View {
    VStack(spacing: 34) {
      TextField("First Name", text: $email)
        .modifier(TextFieldModifier())
      ZStack {
        if showHidePassword {
          TextField("Password", text: $password)
        } else {
          SecureField("Password", text: $password)
        }
        Button {
          showHidePassword.toggle()
        } label: {
          Image(systemName: showHidePassword ? "eye" : "eye.slash")
          
            .resizable()
            .renderingMode(.template)
            .frame(width: 18, height: 14)
            .foregroundColor(Color.gray.opacity(0.75))
        }
        .padding(.leading, 240)
      }
      .modifier(TextFieldModifier())
    }
  }
}
