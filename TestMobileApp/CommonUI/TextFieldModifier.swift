//
//  TextFieldModifier.swift
//  TestMobileApp
//
//  Created by Nikita Stshovsky on 13.03.23.
//

import SwiftUI

struct TextFieldModifier: ViewModifier {
  func body(content: Content) -> some View {
    content
      .frame(width: 288, height: 30)
      .multilineTextAlignment(.center)
      .background(Color.textFieldBackground)
      .cornerRadius(12)
  }
}
