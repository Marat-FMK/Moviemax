//
//  MovieModel.swift
//  Moviemax
//
//  Created by Marat Fakhrizhanov on 08.04.2025.
//

import Foundation

struct Movie: Identifiable {
	let title: String
	let time: Int
	let date: String
	let image: String
	let urlTrailer: String
	var favorite: Bool
	let rating: Double
	let category: String
	let castAndCrew: String
	let id = UUID()
	let responders: Int
}

