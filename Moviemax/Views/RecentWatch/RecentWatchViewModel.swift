//
//  RecentWatchViewModel.swift
//  Moviemax
//
//  Created by Marat Fakhrizhanov on 08.04.2025.
//

import SwiftUI

class RecentWatchViewModel: ObservableObject {
    
    let categories = ["All", "Action", "Adventure", "Mystery", "Fantasy", "Others"]
    var allFilms = [Movie]()
    @Published var chooseCategoryMovies = [Movie]()
    @Published var choosedCategory = "All"

	@AppStorage("favoriteFilmIDs") var favourite: Bool = false

    init() {
        //  allFilms =   fetch movies from CoreData
    }
    
    func chooseCategory(category: String) {
        choosedCategory = category
        chooseCategoryMovies = allFilms.filter{ checkGenreInMovie(genre: $0.genres ?? []) }
    }
    
    func checkGenreInMovie(genre: [SimpleName]) -> Bool{
            var bool = false
            for genre in genre {
                if genre.name == choosedCategory {
                    bool = true
                }
            }
            return bool
    }
    
    func checkChooseCategory(category: String) -> Bool {
        choosedCategory == category
    }
    
    func changeFavorite(id: UUID) {
        
    }
    
}
