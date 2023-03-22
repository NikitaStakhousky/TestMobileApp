//
//  MainTabBarView.swift
//  TestMobileApp
//
//  Created by Nikita Stshovsky on 20.03.23.
//

import SwiftUI


struct MainTabBarView: View {

    var viewModel: MainTabBarViewModel
    @State var selectedTab: String = "person"

    var tab = ["house", "heart", "cart", "bubble.left", "person"]

    var body: some View {

      ZStack(alignment: Alignment(horizontal: .center, vertical: .bottom)) {
        TabView(selection: $selectedTab) {
          ProfileVC(viewModel: ProfileViewModel(currentUser: CurrentUser(photo: "", name: "")))
            .tag("person")
          Text("Hello world")
            .tag("cart")
        }

        HStack(spacing: 0) {
          ForEach(tab, id: \.self) { image in
            TabButton(image: image, selectedTab: $selectedTab)

            if image != tab.last {
              Spacer(minLength: 0)
            }
          }
        }
        .padding(.horizontal, 20)
        .padding(.vertical, 16)
        .background(Color.white)
        .cornerRadius(20)
        .padding(.horizontal)

      }
    }
}

struct TabButton: View {

  var image: String
  @Binding var selectedTab: String
  var body: some View {
    Button {
      selectedTab = image
    } label: {
      Image(systemName: image)
        .renderingMode(.template)
        .foregroundColor(Color.black)
        .frame(width: 40, height: 40)
        .background(selectedTab == image ? Color.textFieldBackground : Color.white)
        .clipShape(Circle())
    }
  }
}

//struct MainTabBarView_Previews: PreviewProvider {
//    static var previews: some View {
//      MainTabBarView(viewModel: MainTabBarViewModel(user: User()))
//    }
//}
