//
//  Model.swift
//  TestMobileApp
//
//  Created by Nikita Stshovsky on 27.03.23.
//

import Foundation


struct Recent: Codable, Identifiable {
    var id = UUID()
    let latest: [Latest]

  enum CodingKeys: String, CodingKey {
    case latest = "latest"
  }
}

// MARK: - Latest
struct Latest: Codable, Identifiable {
    var id = UUID()
    let category, name: String?
    let price: Int?
    let imageURL: URL?

    enum CodingKeys: String, CodingKey {
        case category, name, price
        case imageURL = "image_url"
    }
}

struct Sales: Codable, Identifiable {
    var id = UUID()
    let flashSale: [FlashSale]

  enum CodingKeys: String, CodingKey {
    case flashSale = "flash_sale"
  }
}

// MARK: - FlashSale
struct FlashSale: Codable, Identifiable {
    var id = UUID()
    let category, name: String?
    let price: Double?
    let discount: Int?
    let imageURL: URL?

    enum CodingKeys: String, CodingKey {
        case category, name, price, discount
        case imageURL = "image_url"
    }
}

