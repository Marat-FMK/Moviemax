//
//  SearchViewModel.swift
//  Moviemax
//
//  Created by Marat Fakhrizhanov on 01.04.2025.
//

import SwiftUI


struct Movie {
    let title: String
    let time: String
    let date: String
    let image: String
    let urlTrailer: String
    var favorite: Bool
    let rating: Int
    let category: String
    let castAndCrew: String
    let id = UUID()
}

class SearchViewModel: ObservableObject {
  
    @Published var searchText = ""
    @Published var presentFilter = false
    var foundMovies: [Movie] = [
        Movie(title: "DriftingHome", time: "148", date: "17 Sep 2021", image: "drifting", urlTrailer: "", favorite: true, rating: 5, category: "All", castAndCrew: "no no"),
        Movie(title: "Luck", time: "150", date: "19 Nov 1992", image: "luck", urlTrailer: "", favorite: false, rating: 3, category: "Action", castAndCrew: "no no no"),
        Movie(title: "Fistful", time: "212", date: "21 Jun 2024", image: "fistful", urlTrailer: "", favorite: false, rating: 2, category: "Fantasy", castAndCrew: "no no"),
        Movie(title: "Jurassic world", time: "215", date: "9 Sep 2016", image: "", urlTrailer: "", favorite: true, rating: 5, category: "Fantasy", castAndCrew: "no no")
        ]
    
    var currentCategoryMovies: [Movie] = [
        Movie(title: "DriftingHome", time: "148", date: "17 Sep 2021", image: "drifting", urlTrailer: "", favorite: true, rating: 5, category: "All", castAndCrew: "no no"),
        Movie(title: "Luck", time: "150", date: "19 Nov 1992", image: "luck", urlTrailer: "", favorite: false, rating: 3, category: "Action", castAndCrew: "no no no"),
        Movie(title: "Fistful", time: "212", date: "21 Jun 2024", image: "fistful", urlTrailer: "", favorite: false, rating: 2, category: "Fantasy", castAndCrew: "no no"),
        Movie(title: "Jurassic world", time: "215", date: "9 Sep 2016", image: "", urlTrailer: "", favorite: true, rating: 5, category: "Fantasy", castAndCrew: "no no")
        ]
    
    //FILTER
    @Published var selectedCategories = ["Action", "All", "Adventure", "Others"]
    @Published var chooseCategory = "All"
    @Published var startRating = 1
    let categories = ["All", "Action", "Adventure", "Mystery", "Fantasy", "Others"]
    
    
    func searchFilms() {
        // go to network for array of movies with selectedCategories
    }
    
    func resetFilters() {
        selectedCategories = ["All"]
        startRating = 4
    }
    
    func closeFilters() {
        presentFilter = false
    }
    
    func checkCategoryName(category: String) -> Bool {
        chooseCategory == category
    }
    
    func chooseCategory(category: String) {
        chooseCategory = category
    }
    
    func changeFavorite(id: UUID) {
        //
    }
}

