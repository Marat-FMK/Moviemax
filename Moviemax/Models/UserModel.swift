//
//  UserModel.swift
//  Moviemax
//
//  Created by Julia Martcenko on 14/04/2025.
//

import Foundation

struct User: Identifiable {
	let id: String
	var firstName: String
	var lastName: String
	let password: String
	var email: String
	let dateOfBirth: String
	let gender: String
	let location: String
	let login: String
}
