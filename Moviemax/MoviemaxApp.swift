//
//  MoviemaxApp.swift
//  Moviemax
//
//  Created by Marat Fakhrizhanov on 30.03.2025.
//

import SwiftUI
import FirebaseCore
import Firebase
import FirebaseAuth

class AppDelegate: NSObject, UIApplicationDelegate { //firebase
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()
    return true
  }
}


@main
struct MoviemaxApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate // firebase
    
    var authComplete = UserDefaults.standard.bool(forKey: "authComplete")
    
    var body: some Scene {
        WindowGroup {
            if authComplete {
               TabBarView()
            } else {
               LoginView()
            }
        }
    }
}
