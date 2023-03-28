//
//  SalesScroll.swift
//  TestMobileApp
//
//  Created by Nikita Stshovsky on 27.03.23.
//

import SwiftUI

struct SalesScroll: View {
  @Binding var latestCard: [Recent]
  @Binding var flashSalesCard: [Sales]
  
    var body: some View {
      VStack {
        ScrollView(.vertical, showsIndicators: false) {
          HStack {
            Text("Latest")
            Spacer()
            Button {
              //
            } label: {
              Text("View all")
              .foregroundColor(Color.gray)
              .font(.system(size: 10))
            }
          }.padding()

          ScrollView(.horizontal, showsIndicators: false) {
              HStack(spacing: 12) {
                ForEach(latestCard) { card in
                  ForEach(card.latest) { item in
                    SalesCardView(card: item)
                  }
                }
            }
          }
          HStack {
            Text("Flash Sale")
            Spacer()
            Text("view All")
            .foregroundColor(Color.gray)
            .font(.system(size: 10))
          }.padding()
          
          ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 12) {
              ForEach(flashSalesCard) { card in
                ForEach(card.flashSale) { item in
                  FlashSalesCardView(card: item)
                }
              }
            }
          }
        }
      }
    }
}

//struct SalesScroll_Previews: PreviewProvider {
//    static var previews: some View {
//        SalesScroll()
//    }
//}
