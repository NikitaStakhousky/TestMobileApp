//
//  ProfileViewModel.swift
//  TestMobileApp
//
//  Created by Nikita Stshovsky on 17.03.23.
//

import Foundation

final class ProfileViewModel: ObservableObject {

  @Published var currentUser: CurrentUser

  init(currentUser: CurrentUser) {
    self.currentUser = currentUser
  }

  var data = [ProfileModel(image: "creditcard", secondImage: "chevron.right", itemText: "Trade store"),
              ProfileModel(image: "creditcard", secondImage: "chevron.right", itemText: "Payment method"),
              ProfileModel(image: "creditcard", secondImage: "chevron.right", itemText: "Balance"),
              ProfileModel(image: "creditcard", secondImage: "chevron.right", itemText: "Trade history"),
              ProfileModel(image: "arrow.2.circlepath", secondImage: "chevron.right", itemText: "Restore purchase"),
              ProfileModel(image: "questionmark.circle", secondImage: "", itemText: "Help"),
              ProfileModel(image: "return", secondImage: "", itemText: "Log out")]

  func setProfile() {
    DatabaseService.shared.setUser(user: self.currentUser) { result in
      switch result {
      case .success(let user):
        print(user.name)
      case .failure(let failure):
        print(failure.localizedDescription)
      }
    }
  }

  func getProfile() {
    DatabaseService.shared.getUser { result in
      switch result {
      case .success(let user):
        self.currentUser = user
        print("iwoejdsowehfiowjroiejfwoirejfioirwjfiorw")
      case .failure(let error):
        print(error.localizedDescription)
      }
    }
  }
}
