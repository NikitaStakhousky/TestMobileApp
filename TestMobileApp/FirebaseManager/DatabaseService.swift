//
//  DatabaseService.swift
//  TestMobileApp
//
//  Created by Nikita Stshovsky on 21.03.23.
//

import Foundation
import FirebaseFirestore
import FirebaseAuth

final class DatabaseService {

  static let shared = DatabaseService()

  private let db = Firestore.firestore()

  private var userRef: CollectionReference {
    return db.collection("users")
  }

  private init() {}

  func setUser(user: CurrentUser, completion: @escaping (Result<CurrentUser, Error>) -> Void) {
    userRef.document(AuthService.shared.myUser!.uid).setData(user.representation) { error in
      if let error = error {
        completion(.failure(error))
      } else {
        completion(.success(user))
      }
    }
  }

  func getUser(completion: @escaping (Result<CurrentUser, Error>) -> Void) {

    userRef.document(AuthService.shared.myUser!.uid).getDocument { docSnapshot, error in
      guard let docSnapshot = docSnapshot else {return}

      guard let data = docSnapshot.data() else {return}

      guard let userName = data["name"] as? String else {return}
      guard let userId = data["id"] as? String else {return}
      guard let userPhoto = data["photo"] as? String else {return}

      let user = CurrentUser(id: userId, photo: userPhoto, name: userName)
      completion(.success(user))
    }
  }

}
