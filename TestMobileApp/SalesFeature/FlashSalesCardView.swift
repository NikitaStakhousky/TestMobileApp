//
//  FlashSalesView.swift
//  TestMobileApp
//
//  Created by Nikita Stshovsky on 27.03.23.
//

import SwiftUI

struct FlashSalesCardView: View {
  var card: FlashSale

  var body : some View {
      ZStack {
        AsyncImage(url: card.imageURL) { image in
                  image
                  .resizable()
                  .scaledToFill()
                  .frame(width: 210, height: 340)
                  .cornerRadius(15)
                  .clipped()
              } placeholder: {
                Color.gray
                  .frame(width: 210, height: 340)
                  .cornerRadius(15)
              }

        VStack {
          Spacer()
          VStack(alignment: .leading, spacing: 20) {
            VStack( alignment: .leading, spacing: 4) {
              Capsule()
                .fill(Color.opacityGray)
                .overlay(
                  Text(card.category ?? "")
                    .font(.system(size: 12, weight: .bold))
                )
                .frame(width: 55, height: 22)
              Text(card.name ?? "")
                .foregroundColor(Color.white)
                .font(.system(size: 20, weight: .bold))
            }
            HStack {
              Text("$\(card.price ?? 0)")
                .foregroundColor(Color.white)
                .font(.system(size: 12, weight: .bold))
              Spacer()
              HStack {
                Button {
                  //
                } label: {
                  Image(systemName: "heart")
                    .foregroundColor(Color.black)
                    .padding()
                    .frame(width: 30, height: 30)
                    .background(Color.opacityGray)
                    .clipShape(Circle())
                }

                Button {
                  //
                } label: {
                  Image(systemName: "plus")
                    .foregroundColor(Color.black)
                    .padding()
                    .frame(width: 40, height: 40)
                    .background(Color.opacityGray)
                    .clipShape(Circle())
                }
              }
            }
          }
        }.padding()
      }
    .frame(width: 180, height: 240)
    .cornerRadius(15)
  }
}

//struct FlashSalesView_Previews: PreviewProvider {
//    static var previews: some View {
//      FlashSalesCardView()
//    }
//}
