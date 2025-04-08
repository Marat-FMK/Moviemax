//
//  FavoritesViewModel.swift
//  Moviemax
//
//  Created by Marat Fakhrizhanov on 08.04.2025.
//

import Foundation

class FavoritesViewModel: ObservableObject {
    
    @Published var favoriteMovies: [Movie] = []
    
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
