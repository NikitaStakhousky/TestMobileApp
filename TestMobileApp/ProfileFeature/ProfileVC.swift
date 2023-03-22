//
//  ProfileVC.swift
//  TestMobileApp
//
//  Created by Nikita Stshovsky on 17.03.23.
//

import SwiftUI

struct ProfileVC: View {
  
  @StateObject var viewModel: ProfileViewModel
  @State var showLogin = false

  var body: some View {
    ScrollView {
    VStack {
      profilePhoto()
        .padding(.bottom, 20)
      Text(viewModel.currentUser.name)
        .padding(.bottom, 38)
      ProfileRoundedButton {
       //
      }
      .padding(.bottom, 24)
      VStack(spacing: 24) {
        ForEach(viewModel.data) { item in
          HStack {
            ProfileItem(action: {
              AuthService.shared.signOut()
              showLogin.toggle()
            }, item: item)
            Spacer()
            Button {
              //
            } label: {
              Image(systemName: item.secondImage ?? "")
                .foregroundColor(Color.black)
            }.padding(.trailing, 26)
          }
        }
      }
    }
  }
    .onAppear {
      viewModel.getProfile()
    }
    .fullScreenCover(isPresented: $showLogin, content: {
      AuthVC(viewModel: viewModel)
    })
     .padding()
     .background(Color.backgroundGray)
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
    ProfileVC(viewModel: ProfileViewModel(currentUser: CurrentUser(photo: "", name: "Nikita")))
  }
}
