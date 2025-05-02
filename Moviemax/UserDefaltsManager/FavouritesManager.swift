//
//  FavouritesManager.swift
//  Moviemax
//
//  Created by Julia Martcenko on 29/04/2025.
//

import Foundation

class FavouriteManager {
	static let shared = FavouriteManager()
	private let defaults = UserDefaults.standard

	private init() {}

	// MARK: - Key Builder
	private func key(for userId: String) -> String {
		return "favourites_\(userId)"
	}

	// MARK: - Load All Favourites
	func loadFavourites(for userId: String) -> [String: Bool] {
		return defaults.dictionary(forKey: key(for: userId)) as? [String: Bool] ?? [:]
	}

	// MARK: - Check if a Movie is Favourite
	func isFavourite(userId: String, movieId: String) -> Bool {
		let favourites = loadFavourites(for: userId)
		return favourites[movieId] ?? false
	}

	// MARK: - Set Favourite State
	func setFavourite(userId: String, movieId: String, isFavourite: Bool) {
		var favourites = loadFavourites(for: userId)
		favourites[movieId] = isFavourite
		defaults.set(favourites, forKey: key(for: userId))
	}

	// MARK: - Toggle Favourite
	func toggleFavourite(userId: String, movieId: String) {
		let current = isFavourite(userId: userId, movieId: movieId)
		setFavourite(userId: userId, movieId: movieId, isFavourite: !current)
	}

	// MARK: - Remove All Favourites (Optional Utility)
	func clearFavourites(for userId: String) {
		defaults.removeObject(forKey: key(for: userId))
	}
}
