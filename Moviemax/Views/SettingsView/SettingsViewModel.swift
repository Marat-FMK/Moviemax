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
	@Published var login: String

	@Published var user: User
	@Published var isLoggedOut = false

	init(user: User) {
		self.user = user

		self.firstName = user.firstName
		self.lastName = user.lastName
		self.login = user.login
	}

	func logOut() {
		do {
			try Auth.auth().signOut()
			isLoggedOut = true
		} catch {
			print("Error logging out: \(error.localizedDescription)")
		}
	}
}
