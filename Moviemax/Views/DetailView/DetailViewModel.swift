//
//  DetailViewModel.swift
//  Moviemax
//
//  Created by Julia Martcenko on 04/04/2025.
//

import Foundation

class DetailViewModel: ObservableObject {
	@Published var film: FilmModel
	@Published var isFavorite: Bool = false

    init(film: FilmModel) {
        self.film = film
        self.isFavorite = UserDefaults.standard.isFavorite(filmID: film.id.uuidString) // Если используется сохранение в UserDefaults
    }
    
	func changeFavorite() {
		UserDefaults.standard.toggleFavorite(filmID: film.id.uuidString)
		isFavorite.toggle()
	}
}
