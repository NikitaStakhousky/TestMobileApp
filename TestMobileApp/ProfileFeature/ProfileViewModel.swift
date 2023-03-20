//
//  ProfileViewModel.swift
//  TestMobileApp
//
//  Created by Nikita Stshovsky on 17.03.23.
//

import Foundation

final class ProfileViewModel: ObservableObject {

  var data = [ProfileModel(image: "creditcard", secondImage: "chevron.right", itemText: "Trade store"),
              ProfileModel(image: "creditcard", secondImage: "chevron.right", itemText: "Payment method"),
              ProfileModel(image: "creditcard", secondImage: "chevron.right", itemText: "Balance"),
              ProfileModel(image: "creditcard", secondImage: "chevron.right", itemText: "Trade history"),
              ProfileModel(image: "arrow.2.circlepath", secondImage: "chevron.right", itemText: "Restore purchase"),
              ProfileModel(image: "questionmark.circle", secondImage: "", itemText: "Help"),
              ProfileModel(image: "return", secondImage: "", itemText: "Log out")]
}
