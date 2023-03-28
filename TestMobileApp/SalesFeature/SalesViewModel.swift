//
//  SalesViewModel.swift
//  TestMobileApp
//
//  Created by Nikita Stshovsky on 27.03.23.
//

import Foundation

final class SalesViewModel: ObservableObject {

  @Published var latest: [Recent] = []
  @Published var flashSale: [Sales] = []

  private let productNetworkService = NetworkService()

  func fetchRecentProduct() {
    productNetworkService.getDataOfLatestProducts { [weak self] data in
        DispatchQueue.main.async {
          self?.latest.append(data)
      }
    }
  }

  func fetchFlasSales() {
    productNetworkService.getDataFlashSales { [weak self] data in
      DispatchQueue.main.async {
        self?.flashSale.append(data)
      }
    }
  }

  func onAppear() {
    fetchRecentProduct()
    fetchFlasSales()
  }
}
