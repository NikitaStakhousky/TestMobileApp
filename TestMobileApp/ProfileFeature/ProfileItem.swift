//
//  ProfileItem.swift
//  TestMobileApp
//
//  Created by Nikita Stshovsky on 17.03.23.
//

import SwiftUI

struct ProfileItem: View {
  var action: () -> Void
  var item: ProfileModel

  var body: some View {
      HStack(spacing: 12) {
        Button {
          action()
        } label: {
          Image(systemName: item.image)
            .frame(width: 32, height: 32)
            .background(Color.textFieldBackground)
            .clipShape(Circle())
            .foregroundColor(Color.black)
          Text(item.itemText)
            .font(.system(size: 16, weight: .light))
            .foregroundColor(Color.black)
          Spacer()
        }
      }
      .padding(.leading, 24)
    }
  }

struct ProfileItem_Previews: PreviewProvider {
  static var previews: some View {
    ProfileItem(action: {}, item: ProfileModel(image: "creditcard", secondImage: "chevron.right", itemText: "Payment method"))
  }
}
