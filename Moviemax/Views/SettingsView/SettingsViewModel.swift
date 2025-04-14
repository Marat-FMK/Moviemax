//
//  SettingsViewModel.swift
//  Moviemax
//
//  Created by Julia Martcenko on 14/04/2025.
//

import Foundation

class SettingsViewModel: ObservableObject {
	@Published var name: String
	@Published var surname: String
	@Published var login: String

	init(name: String, surname: String, login: String) {
		self.name = name
		self.surname = surname
		self.login = login
	}
}
