//
//  DetailViewModel.swift
//  Moviemax
//
//  Created by Julia Martcenko on 04/04/2025.
//

import Foundation

class DetailViewModel: ObservableObject {
	@Published var movie: Movie
	@Published var isFavorite: Bool = false

    init(movie: Movie) {
        self.movie = movie
        self.isFavorite = UserDefaults.standard.isFavorite(filmID: movie.id.uuidString) // Если используется сохранение в UserDefaults
    }
    
	func changeFavorite() {
		UserDefaults.standard.toggleFavorite(filmID: movie.id.uuidString)
		isFavorite.toggle()
	}
}
