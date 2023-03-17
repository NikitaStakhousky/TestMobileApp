//
//  ProfileModel.swift
//  TestMobileApp
//
//  Created by Nikita Stshovsky on 17.03.23.
//

import Foundation

struct ProfileModel: Identifiable {
  var id = UUID()
  var image: String
  var secondImage: String?
  var itemText: String
}
