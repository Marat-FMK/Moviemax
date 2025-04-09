//
//  SearchViewModel.swift
//  Moviemax
//
//  Created by Marat Fakhrizhanov on 01.04.2025.
//

import SwiftUI


struct Movie: Identifiable {
    let title: String
	let time: Int
    let date: String
    let image: String
    let urlTrailer: String
    var favorite: Bool
	let rating: Double
    let category: String
    let castAndCrew: String
    let id = UUID()
	let responders: Int
}

class SearchViewModel: ObservableObject {
  
    @Published var searchText = ""
    
    //FILTER
    @Published var presentFilter = false
    @Published var selectedCategories = ["All", "Adventure"]
    @Published var temporaryCategories: [String] = []
    @Published var chooseCategory = "All"
    
    @Published var selectedRating = [2,3]
    @Published var temporaryRating = [Int]()
    @Published var chooseRating = 4
    
    var foundMovies: [Movie] = [
		Movie(title: "Drifting Home", time: 148, date: "17 Sep 2021", image: "drifting", urlTrailer: "", favorite: true, rating: 5, category: "All", castAndCrew: "no no", responders: 53),
		Movie(title: "Luck", time: 150, date: "19 Nov 1992", image: "luck", urlTrailer: "", favorite: false, rating: 3, category: "Action", castAndCrew: "no no no", responders: 53),
		Movie(title: "Fistful", time: 212, date: "21 Jun 2024", image: "fistful", urlTrailer: "", favorite: false, rating: 2, category: "Fantasy", castAndCrew: "no no", responders: 53),
		Movie(title: "Jurassic world", time: 215, date: "9 Sep 2016", image: "", urlTrailer: "", favorite: true, rating: 5, category: "Fantasy", castAndCrew: "no no", responders: 53)
        ]
    
    var currentCategoryMovies: [Movie] = [
		Movie(title: "Drifting Home", time: 148, date: "17 Sep 2021", image: "drifting", urlTrailer: "", favorite: true, rating: 5, category: "All", castAndCrew: "no no", responders: 34),
		Movie(title: "Luck", time: 150, date: "19 Nov 1992", image: "luck", urlTrailer: "", favorite: false, rating: 3, category: "Action", castAndCrew: "no no no", responders: 67),
		Movie(title: "Fistful", time: 212, date: "21 Jun 2024", image: "fistful", urlTrailer: "", favorite: false, rating: 2, category: "Fantasy", castAndCrew: "no no", responders: 25),
		Movie(title: "Jurassic world", time: 215, date: "9 Sep 2016", image: "", urlTrailer: "", favorite: true, rating: 5, category: "Fantasy", castAndCrew: "no no", responders: 115)
        ]
    
    func searchFilms() {
        // go to network for array of movies with choosedCategory
    }
    
    func chooseCategory(category: String) {
        chooseCategory = category
        //search films with choose categoty
        //currentCategoryMovies = searchedFilms
    }
    
    func changeFavorite(id: UUID) {
        //
    }
    
    
    // FILTER
    
    func checkCategoryName(category: String) -> Bool {
           chooseCategory == category
       }
       
    func resetFilters() {
        temporaryCategories = ["All"]
        selectedCategories = ["All"]
        chooseCategory = "All"
        
        temporaryRating = [4]
        selectedRating = [4]
        chooseRating = 4
    }
    
    func applyFilters() {
        if temporaryCategories.isEmpty {
            selectedCategories = ["All"]
            chooseCategory = "All"
        } else {
            selectedCategories = temporaryCategories
            chooseCategory = selectedCategories[0]
        }
        
        if temporaryRating.isEmpty {
            selectedRating = [4]
            chooseRating = 4
        } else {
            selectedRating = temporaryRating
            chooseRating = selectedRating[0]
        }
        
        print(selectedCategories)
        print(selectedRating)
        print(chooseCategory)
        print(chooseRating)
    }
    
    func setTemporaryFilterArrays() {
        temporaryCategories = selectedCategories
        temporaryRating = selectedRating
    }
    
    func checkFilterCategory(category: String) -> Bool {
        temporaryCategories.contains(category)
    }
       
    func addOrRemoveSelectedCategory(category: String) {
        if temporaryCategories.contains(category) {
            let result = temporaryCategories.filter{$0 != category}
            temporaryCategories = result
            } else {
                temporaryCategories.append(category)
            }
    }
    
    func checkRatint( rating: Int) -> Bool {
        temporaryRating.contains(rating)
    }
    
    func addOrRemoveSelectedRating(rating: Int) {
        if temporaryRating.contains(rating) {
            let result = temporaryRating.filter{$0 != rating}
            temporaryRating = result
            } else {
                temporaryRating.append(rating)
            }
    }
    
}

