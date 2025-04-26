//
//  FavoritesViewModel.swift
//  Moviemax
//
//  Created by Marat Fakhrizhanov on 08.04.2025.
//

import SwiftUI

class FavoritesViewModel: ObservableObject {
    
    @Published var favoriteMovies: [Movie] = []
	@AppStorage("favoriteFilmIDs") var favourite: Bool = false

    init(){
        fetchFavorites()
    }
    
    func fetchFavorites() {
        // favoriteMovies =  fetch favorites view from CoreDate
    }
    
    func changeFavorite(id: UUID) {
        //
    }
}
