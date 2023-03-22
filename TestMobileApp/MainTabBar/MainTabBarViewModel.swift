//
//  MainTabBarViewModel.swift
//  TestMobileApp
//
//  Created by Nikita Stshovsky on 22.03.23.
//

import Foundation
import FirebaseAuth

final class MainTabBarViewModel: ObservableObject {

  @Published var user: User?

  init(user: User) {
    self.user = user
  }
}
