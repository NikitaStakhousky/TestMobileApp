//
//  RoundedButton.swift
//  TestMobileApp
//
//  Created by Nikita Stshovsky on 13.03.23.
//

import SwiftUI

struct RoundedButton: View {
  var action: () -> Void
  var text: String

    var body: some View {
      Button {
        action()
      } label: {
        Text(text)
          .bold()
          .foregroundColor(Color.white)
          .frame(width: 290, height: 46)
          .background(Color.mainButton)
          .cornerRadius(16)
      }

    }
}

struct RoundedButton_Previews: PreviewProvider {
    static var previews: some View {
      RoundedButton(action: {}, text: "Log In")
    }
}
