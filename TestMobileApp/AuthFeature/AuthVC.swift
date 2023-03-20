//
//  ContentView.swift
//  TestMobileApp
//
//  Created by Nikita Stshovsky on 13.03.23.
//

import SwiftUI

struct AuthVC: View {

  @EnvironmentObject private var viewModel: AuthViewModel
  @State private var email = ""
  @State private var password = ""
  @State private var firstName = ""
  @State private var alert = false
  @State private var message = ""
  @State private var show = false
  @State private var isTabViewShow = false

  var body: some View {
    NavigationView {
      VStack {
        Text("Sign In")
          .font(.system(size: 25, weight: .semibold))
          .shadow(radius: 1)
          .padding(.bottom, 78)
        textFields()
          .padding(.bottom, 46)
        RoundedButton(action: {
          AuthService.shared.signUp(email: email, password: password) { result in
            switch result {
            case .success(let user):
              print("auth succes")
              isTabViewShow.toggle()
            case .failure(let error):
              if !viewModel.textFieldValidatorEmail(email) {
                message = "email address entered incorrectly"
              } else {
                message = "incorrect data"
              }
              alert.toggle()
            }
          }
        }, text: "Sign In")
        logIn()
        logInWith()
      }
      .padding()
      .alert(isPresented: $alert) {
        Alert(title: Text("Error"), message: Text(self.message), dismissButton: .default(Text("Ok")))
      }
      .fullScreenCover(isPresented: $show) {
        LogInVC(show: $show)
      }
      .fullScreenCover(isPresented: $isTabViewShow) {
        MainTabBarView(selectedTab: "person")
      }
    }
  }

  private func textFields() -> some View {
    VStack(spacing: 34) {
      TextField("First Name", text: $firstName)
        .modifier(TextFieldModifier())
      SecureField("Password", text: $password)
        .modifier(TextFieldModifier())
      TextField("Email", text: $email)
        .modifier(TextFieldModifier())
    }
  }

  private func logIn() -> some View {
    HStack {
      Text("Already have an account?")
        .font(.system(size: 8, weight: .light))
      Button {
        show.toggle()
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
