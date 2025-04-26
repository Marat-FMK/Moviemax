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
        chooseCategoryMovies = allFilms.filter{ $0.category == choosedCategory}
    }
    
    func checkChooseCategory(category: String) -> Bool {
        choosedCategory == category
    }
    
    func changeFavorite(id: UUID) {
        
    }
    
}
