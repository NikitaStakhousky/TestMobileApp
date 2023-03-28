//
//  CategoryScroll.swift
//  TestMobileApp
//
//  Created by Nikita Stshovsky on 27.03.23.
//

import SwiftUI

struct Category: Identifiable {
  var id = UUID()
  let image: String
  let text: String
}

struct CategoryScroll: View {

  let model = [Category(image: "candybarphone", text: "Phones"), Category(image: "headphones", text: "Headphones"), Category(image: "gamecontroller", text: "Game"), Category(image: "car.side", text: "Cars"), Category(image: "bed.double", text: "Furniture"), Category(image: "poweroutlet.type.f", text: "Kids")]


    var body: some View {
      ScrollView(.horizontal, showsIndicators: false) {
        HStack(spacing: 24) {
          ForEach(model) { item in
              Button {
                //
              } label: {
                VStack {
                  Image(systemName: "\(item.image)")
                    .foregroundColor(Color.black)
                    .padding()
                    .frame(width: 40, height: 40)
                    .background(Color.opacityGray)
                    .clipShape(Circle())
                  Text(item.text)
                    .foregroundColor(Color.gray)
                    .font(.system(size: 10))
                }
              }
            }
        }.padding()
      }
    }
}

struct CategoryScroll_Previews: PreviewProvider {
    static var previews: some View {
        CategoryScroll()
    }
}
