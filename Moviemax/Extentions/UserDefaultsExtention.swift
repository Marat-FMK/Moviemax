//
//  UserDefaultsExtention.swift
//  Moviemax
//
//  Created by Julia Martcenko on 07/04/2025.
//

//import Foundation
//
//extension UserDefaults {
//	private var favoriteKey: String { "favoriteFilmIDs" }
//
//	var favoriteFilmIDs: Set<String> {
//		get {
//			let array = array(forKey: favoriteKey) as? [String] ?? []
//			return Set(array)
//		}
//		set {
//			set(Array(newValue), forKey: favoriteKey)
//		}
//	}
//
//	func isFavorite(filmID: String) -> Bool {
//		favoriteFilmIDs.contains(filmID)
//	}
//
//	func toggleFavorite(filmID: String) {
//		var current = favoriteFilmIDs
//		if current.contains(filmID) {
//			current.remove(filmID)
//		} else {
//			current.insert(filmID)
//		}
//		favoriteFilmIDs = current
//	}
//}
