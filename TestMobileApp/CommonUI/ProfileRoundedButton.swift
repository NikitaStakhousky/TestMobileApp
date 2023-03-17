//
//  ProfileRoundedButton.swift
//  TestMobileApp
//
//  Created by Nikita Stshovsky on 17.03.23.
//

import SwiftUI

struct ProfileRoundedButton: View {
  var action: () -> Void

    var body: some View {
      Button {
        action()
      } label: {
        ZStack {
          Image(systemName: "square.and.arrow.up")
            .padding(.trailing, 240)
          Text("upload item")
            .multilineTextAlignment(.center)
        }
        .font(.system(size: 14, weight: .semibold))
        .foregroundColor(Color.white)
        .frame(width: 290, height: 40)
        .background(Color.mainButton)
        .cornerRadius(16)
      }
    }
}

struct ProfileRoundedButton_Previews: PreviewProvider {
    static var previews: some View {
      ProfileRoundedButton(action: {})
    }
}
