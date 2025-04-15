//
//  MoviemaxApp.swift
//  Moviemax
//
//  Created by Marat Fakhrizhanov on 30.03.2025.
//

import SwiftUI
import FirebaseCore

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
	@AppStorage("isDarkMode") var isDarkMode: Bool = false

    var body: some Scene {
        WindowGroup {
            TabBarView()
				.preferredColorScheme(isDarkMode ? .dark : .light)
        }
    }
}
