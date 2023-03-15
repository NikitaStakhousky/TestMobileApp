//
//  LogInVC.swift
//  TestMobileApp
//
//  Created by Nikita Stshovsky on 15.03.23.
//

import SwiftUI

struct LogInVC: View {

  @State var firstName = ""
  @State var password = ""
  @State var showHidePassword = false

  var body: some View {
    VStack {
      Text("Welcome Back")
        .font(.system(size: 24, weight: .semibold))
        .padding(.bottom, 80)
      logInTextFields()
        .padding(.bottom, 100)
      RoundedButton(action: {}, text: "Log In")
    }
  }

  private func logInTextFields() -> some View {
    VStack(spacing: 34) {
      TextField("First Name", text: $firstName)
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

struct LogInVC_Previews: PreviewProvider {
  static var previews: some View {
    LogInVC()
  }
}
