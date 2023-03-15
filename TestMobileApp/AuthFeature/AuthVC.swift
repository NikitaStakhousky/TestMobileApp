//
//  ContentView.swift
//  TestMobileApp
//
//  Created by Nikita Stshovsky on 13.03.23.
//

import SwiftUI

struct AuthVC: View {
  
  @EnvironmentObject var viewModel: AuthViewModel

  @State var text = ""

  var body: some View {
    VStack {
      Text("Sign In")
        .font(.system(size: 25, weight: .semibold))
        .shadow(radius: 1)
        .padding(.bottom, 78)
      textFields()
        .padding(.bottom, 46)
      RoundedButton(action: {}, text: "Sign In")
      logIn()
      logInWith()
    }
    .padding()
  }

  private func textFields() -> some View {
    VStack(spacing: 34) {
      TextField("First Name", text: $text)
        .modifier(TextFieldModifier())
      SecureField("Password", text: $text)
        .modifier(TextFieldModifier())
      TextField("Email", text: $text)
        .modifier(TextFieldModifier())
    }
  }

  private func logIn() -> some View {
    HStack {
      Text("Already have an account?")
        .font(.system(size: 8, weight: .light))
      Button {
        //
      } label: {
        Text("Log in")
          .font(.system(size: 8, weight: .semibold))
          .foregroundColor(Color.blueTint)
      }
    }
    .frame(maxWidth: .infinity, alignment: .leading)
    .padding(.top, 18)
    .padding(.leading, 42)
  }

  private func logInWith() -> some View {
    VStack(spacing: 42) {
      HStack {
        Button {
          //
        } label: {
          Image("google")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 24, height: 24)
        }
        Text("Sign in with Google")
          .font(.system(size: 12, weight: .light))
      }
      HStack {
        Button {
          //
        } label: {
          Image("apple")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 24, height: 24)
        }
        Text("Sign in with Apple")
          .font(.system(size: 12, weight: .light))
      }
    }
    .padding(.top, 82)
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    AuthVC()
  }
}
