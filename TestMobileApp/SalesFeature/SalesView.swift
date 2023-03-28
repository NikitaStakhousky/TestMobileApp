//
//  SalesView.swift
//  TestMobileApp
//
//  Created by Nikita Stshovsky on 22.03.23.
//

import SwiftUI

struct SalesView: View {
  @StateObject var viewModel: SalesViewModel
  @State private var searchText = ""

  var body: some View {
    NavigationView {
      VStack {
        TextField("What are you looking for", text: $searchText)
          .frame(width: 280, height: 24)
          .multilineTextAlignment(.center)
          .background(Color.textFieldBackground)
          .cornerRadius(12)
          .padding(.top, 22)
        CategoryScroll()
          .padding(.bottom, 6)
        SalesScroll(latestCard: $viewModel.latest, flashSalesCard: $viewModel.flashSale)

        Text("hello")
          .onAppear {
            viewModel.onAppear()
          }
      }
      .navigationBarItems(leading:
                            HStack(spacing: 66) {
        Button {
          //
        } label: {
          Image(systemName: "text.justify")
            .foregroundColor(Color.black)
            .bold()
        }
        HStack {
          Text("Trade by")
            .font(.system(size: 18, weight: .bold))
          Text("Bata")
            .font(.system(size: 18, weight: .bold))
            .foregroundColor(Color.mainButton)
        }
      }
                          ,trailing:
                            VStack(spacing: 2) {
        Button(action: {
          withAnimation {

          }
          print("Open the side menu")
        }) {
          Image("person").resizable().frame(width: 35, height: 35).clipShape(Circle())
        }
        Button {
          //
        } label: {
          HStack {
            Text("Location")
              .font(.system(size: 8, weight: .light))
              .foregroundColor(Color.black)
            Image(systemName: "chevron.down")
              .resizable()
              .frame(width: 10, height: 6)
              .foregroundColor(.gray)
          }
        }
      }.padding(.top,20)
        .padding(.trailing,20)
      )
    }
  }
}

//struct SalesView_Previews: PreviewProvider {
//  static var previews: some View {
//    SalesView()
//  }
//}
