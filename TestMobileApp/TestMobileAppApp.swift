//
//  TestMobileAppApp.swift
//  TestMobileApp
//
//  Created by Nikita Stshovsky on 13.03.23.
//

import SwiftUI
import FirebaseCore

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()

    return true
  }
}

@main
struct TestMobileAppApp: App {

  @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
  
    var body: some Scene {
        WindowGroup {
          AuthVC().environmentObject(AuthViewModel())
        }
    }
}
