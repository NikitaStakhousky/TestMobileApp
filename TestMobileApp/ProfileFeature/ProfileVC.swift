//
//  ProfileVC.swift
//  TestMobileApp
//
//  Created by Nikita Stshovsky on 17.03.23.
//

import SwiftUI

struct ProfileVC: View {
  @EnvironmentObject var viewModel: ProfileViewModel
  var body: some View {
    VStack() {
      profilePhoto()
        .padding(.bottom, 20)
      Text("Mikita Stakhousy")
        .padding(.bottom, 38)
      ProfileRoundedButton {
        //
      }
      .padding(.bottom, 14)
      VStack(spacing: 24) {
        ForEach(viewModel.data) { item in
          HStack {
            ProfileItem(action: {}, item: item)
            Spacer()
            Button {
              //
            } label: {
              Image(systemName: item.secondImage ?? "")
                .foregroundColor(Color.black)
            }.padding(.trailing, 46)
          }
        }
      }
    }
  }

  private func profilePhoto() -> some View {
    Button {

    } label: {
      VStack {
        Image("apple")
          .resizable()
          .frame(width: 60, height: 60)
          .clipShape(Circle())
        Text("change Photo")
          .foregroundColor(Color.lightGray)
          .font(.system(size: 10))
      }
    }
  }
}

struct ProfileVC_Previews: PreviewProvider {
  static var previews: some View {
    ProfileVC()
  }
}
