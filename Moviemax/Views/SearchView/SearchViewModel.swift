//
//  SearchViewModel.swift
//  Moviemax
//
//  Created by Marat Fakhrizhanov on 01.04.2025.
//

import SwiftUI

class SearchViewModel: ObservableObject {
    
    @Published var searchText = ""
    
    @AppStorage("favoriteFilmIDs") var favourite: Bool = false
    
    //FILTER
    @Published var presentFilter = false
    @Published var selectedCategories = ["All", "комедия", "драма", "детектив", "боевик", "криминал", "приключения"]
    @Published var temporaryCategories: [String] = []
    @Published var chooseCategory = "All"
    
    @Published var selectedRating = [2,3]
    @Published var temporaryRating = [Int]()
    @Published var chooseRating = 4
    
    @Published var currentCategoryMovies: [Movie] = []
    var foundMovies: [Movie] = []

    func searchFilms() {
        ApiService().searchMovies(searchText: searchText) { movies in
            
            var currentMovies: [Movie] = []
            for movie in movies {
                if movie.description != nil && movie.description != "" && movie.poster?.url != nil && movie.name != "" {
                    currentMovies.append(movie)
                }
            }
            self.foundMovies = currentMovies
            self.updateCurrentCategoryMovies()
        }
    }
    
    func checkGenreInMovie(genre: [Genre]) -> Bool{
            var bool = false
            for genre in genre {
                if genre.name == chooseCategory {
                    bool = true
                }
            }
            return bool
    }

    func updateCurrentCategoryMovies() {
            if chooseCategory == "ALL" {
                currentCategoryMovies = foundMovies
            } else {
                currentCategoryMovies = foundMovies.filter{ checkGenreInMovie(genre: $0.genres ?? [])} // ??
            }
    }
        
    func chooseUserCategory(category: String) {
        chooseCategory = category
        //search films with choose categoty
        //currentCategoryMovies = searchedFilms
        updateCurrentCategoryMovies()
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
        
        presentFilter.toggle()
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



//[
//    Movie(title: "Drifting Home", date: .now, image: "drifting", urlTrailer: "", rating: 5.1, timing: 112, responders: 105, category: "All", description: """
//Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.
//""", castCrew: [
//CrewMemberModel(image: "Director", name: "Jon Watts", role: "Director"),
//CrewMemberModel(image: "Director", name: "Jon Watts", role: "Director"),
//CrewMemberModel(image: "Director", name: "Jon Watts", role: "Director")
//]),
//    Movie(title: "Luck", date: .now, image: "luck", urlTrailer: "", rating: 4.4, timing: 148, responders: 54, category: "Adventure", description: """
//Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book 
//""", castCrew: [
//CrewMemberModel(image: "Director", name: "Jon Watts", role: "Director"),
//CrewMemberModel(image: "Director", name: "Jon Watts", role: "Director"),
//CrewMemberModel(image: "Director", name: "Jon Watts", role: "Director")
//]),
//    Movie(title: "Fistful", date: .now, image: "fistful", urlTrailer: "", rating: 3.2, timing: 212, responders: 45, category: "Fantasy", description: """
//Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book 
//""", castCrew: [
//CrewMemberModel(image: "Director", name: "Jon Watts", role: "Director"),
//CrewMemberModel(image: "Director", name: "Jon Watts", role: "Director"),
//CrewMemberModel(image: "Director", name: "Jon Watts", role: "Director")
//]),
//    Movie(title: "Jurassic world", date: .now, image: "", urlTrailer: "", rating: 5, timing: 215, responders: 115, category: "Adventure", description: """
//Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book 
//""", castCrew: [
//CrewMemberModel(image: "Director", name: "Jon Watts", role: "Director"),
//CrewMemberModel(image: "Director", name: "Jon Watts", role: "Director"),
//CrewMemberModel(image: "Director", name: "Jon Watts", role: "Director")
//])
//]

