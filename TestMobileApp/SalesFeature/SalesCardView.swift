//
//  SalesCard.swift
//  TestMobileApp
//
//  Created by Nikita Stshovsky on 27.03.23.
//

import SwiftUI

struct SalesCardView: View {
  var card: Latest
  //  @State var show  = false

  var body : some View {

    ZStack {
      AsyncImage(url: card.imageURL) { image in
          image
          .resizable()
          .scaledToFill()
          .frame(width: 114, height: 150)
          .cornerRadius(15)
          .clipped()
      } placeholder: {
        Color.gray
          .frame(width: 114, height: 150)
          .cornerRadius(15)
      }

      VStack {
        Spacer()
      HStack {
        VStack(alignment: .leading, spacing: 20) {
          VStack( alignment: .leading, spacing: 4) {
                Capsule()
                  .fill(Color.opacityGray)
                  .overlay(
                    Text(card.category ?? "")
                      .font(.system(size: 6, weight: .bold))
                  )
                  .frame(width: 35, height: 12)
            Text(card.name ?? "")
                .foregroundColor(Color.white)
                .font(.system(size: 10, weight: .bold))
            }
          Text("$\(card.price ?? 0)")
            .foregroundColor(Color.white)
            .font(.system(size: 8, weight: .bold))
        }
        Spacer()
        Button {
          //
        } label: {
          Image(systemName: "plus")
            .foregroundColor(Color.black)
            .padding()
            .frame(width: 20, height: 20)
            .background(Color.opacityGray)
            .clipShape(Circle())
        }
      }
      }.padding()
    }
    .frame(width: 120, height: 160)
    .cornerRadius(15)
  }
}

//struct SalesCard_Previews: PreviewProvider {
//  static var previews: some View {
//    SalesCard()
//  }
//}
