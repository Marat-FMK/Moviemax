//
//  MovieModel.swift
//  Moviemax
//
//  Created by Marat Fakhrizhanov on 08.04.2025.
//

import Foundation

struct Movie: Identifiable, Equatable {
	let id = UUID()
	let title: String
	let date: Date
	let image: String
	let urlTrailer: String
	let rating: Double
	let timing: Int
	let responders: Int
	let category: String
	let description: String
	let castCrew: [CrewMemberModel]
}

struct CrewMemberModel: Hashable, Equatable {
	let image: String
	let name: String
	let role: String
}
