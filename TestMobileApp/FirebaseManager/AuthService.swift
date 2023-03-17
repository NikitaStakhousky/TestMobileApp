//
//  AuthService.swift
//  TestMobileApp
//
//  Created by Nikita Stshovsky on 17.03.23.
//

import Foundation
import FirebaseAuth

final class AuthService {

  static let shared = AuthService()

  private init() { }

  private let auth = Auth.auth()

  private var currentUser: User? {
    return auth.currentUser
  }

  func signUp(email: String, password: String, completion: @escaping (Result<User, Error>) -> Void) {
    auth.createUser(withEmail: email, password: password) {(result, error) in
      if let result = result {
        completion(.success(result.user))
      } else if let error = error {
        completion(.failure(error))
      }
    }
  }

  func signIn(email: String, password: String, completion: @escaping (Result<User, Error>) -> Void) {
    auth.signIn(withEmail: email, password: password) { (result, error) in
      if let result = result {
        completion(.success(result.user))
      } else if let error = error {
        completion(.failure(error))
      }
    }
  }
}
