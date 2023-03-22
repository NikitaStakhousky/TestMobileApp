//
//  UserModel.swift
//  TestMobileApp
//
//  Created by Nikita Stshovsky on 21.03.23.
//

import Foundation

struct CurrentUser: Identifiable {
  var id = UUID().uuidString
  var photo: String
  var name: String

  var representation: [String: Any] {
    var represent = [String: Any]()
    represent["id"] = self.id
    represent["name"] = self.name
    represent["photo"] = self.photo
    return represent
  }
}
