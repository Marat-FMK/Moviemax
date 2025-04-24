//
//  SettingsViewModel.swift
//  Moviemax
//
//  Created by Julia Martcenko on 14/04/2025.
//

import Foundation
import FirebaseAuth

class SettingsViewModel: ObservableObject {
	@Published var firstName: String
	@Published var lastName: String
    @Published var login: String = ""
    @Published var emailForChangePassword = ""

//	@Published var user: User
//	@Published var isLoggedOut = false

//	init(user: User) {
//		self.user = user
//
//		self.firstName = user.firstName
//		self.lastName = user.lastName
//		self.login = user.login
//	}
    
    init() {
        firstName = FireBaseDataService.shared.firstName
        lastName = FireBaseDataService.shared.lastName
        setLogin()
        
    }
    
    func loudFromUD() {
        firstName = UserDefaults.standard.string(forKey: "firstName") ?? ""
        lastName = UserDefaults.standard.string(forKey: "lastName") ?? ""
    }

    func setLogin() {
        let login = FireBaseDataService.shared.email.split(separator: "@")[0]
        self.login = String("@" + login)
    }
    
    func changePasswordWithEmail() {
        FireBaseDataService.shared.passwordResetWithEmail(email: emailForChangePassword)
    }
	func logOut() {
        FireBaseDataService.shared.signOut()
	}
}
