//
//  NetworkService.swift
//  TestMobileApp
//
//  Created by Nikita Stshovsky on 27.03.23.
//

import Foundation

class NetworkService {
  
  func getDataOfLatestProducts(completion: @escaping (Recent) -> Void) {
    let jsonURLString = "https://run.mocky.io/v3/cc0071a1-f06e-48fa-9e90-b1c2a61eaca7"
    guard let url = URL(string: jsonURLString) else { return }
    var request = URLRequest(url: url)
    request.httpMethod = "GET"

    let task = URLSession.shared.dataTask(with: request) { data, response, error in
      if let data = data, let recent = try? JSONDecoder().decode(Recent.self, from: data) {
          completion(recent)
      } else {
        print("error")
      }
    }
    task.resume()
  }

  func getDataFlashSales(completion: @escaping (Sales) -> Void) {
    let jsonURLString = "https://run.mocky.io/v3/a9ceeb6e-416d-4352-bde6-2203416576ac"
    guard let url = URL(string: jsonURLString) else {return}
    var request = URLRequest(url: url)
    request.httpMethod = "GET"

    let task = URLSession.shared.dataTask(with: request) { data, response, error in
      if let data = data, let flashSale = try? JSONDecoder().decode(Sales.self, from: data) {
          completion(flashSale)
      } else {
        print("error")
      }
    }
    task.resume()
  }
}
