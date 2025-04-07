//
//  FilmModel.swift
//  Moviemax
//
//  Created by Julia Martcenko on 04/04/2025.
//

import Foundation

struct FilmModel {
	let id: UUID
	let image: String
	let title: String
	let date: Date
	let rating: Int
	let timing: Int
	let category: String
	let description: String
	let castCrew: [CrewMemberModel]
}

struct CrewMemberModel: Hashable {
	let image: String
	let name: String
	let role: String
}
