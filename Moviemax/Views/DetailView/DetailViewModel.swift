//
//  DetailViewModel.swift
//  Moviemax
//
//  Created by Julia Martcenko on 04/04/2025.
//

import Foundation

class DetailViewModel: ObservableObject {
	let firebaseManager = FireBaseDataService.shared

	@Published var movie: Movie
	@Published var isFavorite: Bool = false

	let favouriteManager = FavouriteManager.shared

	init(movie: Movie) {
        self.movie = movie
		self.isFavorite = favouriteManager.isFavourite(userId: firebaseManager.currentUserID, movieId: movie.id.uuidString)
    }

	func getFavourite() {
		isFavorite = favouriteManager.isFavourite(userId: firebaseManager.currentUserID, movieId: movie.id.uuidString)
	}

	func changeFavorite() {
		favouriteManager.toggleFavourite(userId: firebaseManager.currentUserID, movieId: movie.id.uuidString)
		isFavorite.toggle()
	}
}
