//
//  MainViewModel.swift
//  Moviemax
//
//  Created by Julia Martcenko on 07/04/2025.
//

import Foundation

struct ProfileModel: Identifiable {
	var id: UUID = UUID()
	var name: String
	var avatar: String
}

class MainViewModel: ObservableObject {

	@Published var categories = ["All", "Adventure", "Fantasy", "Action"]
	@Published var choosenCategory = "All"

	@Published var favoriteFilmIDs: Set<String> = UserDefaults.standard.favoriteFilmIDs {
		didSet {
			UserDefaults.standard.favoriteFilmIDs = favoriteFilmIDs
		}
	}

	@Published var currentIndex: Int = 1
	@Published var profile = ProfileModel(name: "Julia", avatar: "avatar")

    init() {
        profile.name = FireBaseDataService.shared.firstName
    }
    
	var allMovies: [Movie] = [
		Movie(title: "Drifting Home", time: 148, date: "17 Sep 2021", image: "drifting", urlTrailer: "", favorite: true, rating: 5.1, category: "All", castAndCrew: "no no", responders: 53),
		Movie(title: "Luck", time: 150, date: "19 Nov 1992", image: "luck", urlTrailer: "", favorite: false, rating: 3.3, category: "Action", castAndCrew: "no no no", responders: 25),
		Movie(title: "Fistful", time: 212, date: "21 Jun 2024", image: "fistful", urlTrailer: "", favorite: false, rating: 2, category: "Fantasy", castAndCrew: "no no", responders: 46),
		Movie(title: "Jurassic world", time: 215, date: "9 Sep 2016", image: "", urlTrailer: "", favorite: true, rating: 5, category: "Fantasy", castAndCrew: "no no", responders: 115)
	]

	var currentCategoryMovies: [Movie] {
		if choosenCategory == "All" {
			return allMovies
		} else {
			return allMovies.filter { $0.category == choosenCategory }
		}
	}

	func checkCategoryName(category: String) -> Bool {
		choosenCategory == category
	}

	func chooseCategory(category: String) {
		choosenCategory = category
		//search films with choose categoty
		//currentCategoryMovies = searchedFilms
	}

	func isFavorite(movie: Movie) -> Bool {
		favoriteFilmIDs.contains(movie.id.uuidString)
	}

	func toggleFavorite(movie: Movie) {
		let filmID = movie.id.uuidString
		if favoriteFilmIDs.contains(filmID) {
			favoriteFilmIDs.remove(filmID)
		} else {
			favoriteFilmIDs.insert(filmID)
		}
	}

}
