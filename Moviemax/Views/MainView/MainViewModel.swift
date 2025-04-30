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

    
	var allMovies: [Movie] = [
		Movie(title: "Drifting Home", date: "2005", image: "drifting", urlTrailer: "", rating: 5.1, timing: 112, responders: 105, category: "All", description: """
 Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.
 """, castCrew: [
	CrewMemberModel(image: "Director", name: "Jon Watts", role: "Director"),
	CrewMemberModel(image: "Director", name: "Jon Watts", role: "Director"),
	CrewMemberModel(image: "Director", name: "Jon Watts", role: "Director")
 ]),
		Movie(title: "Luck", date: "2002", image: "luck", urlTrailer: "", rating: 4.4, timing: 148, responders: 54, category: "Adventure", description: """
 Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book 
 """, castCrew: [
	CrewMemberModel(image: "Director", name: "Jon Watts", role: "Director"),
	CrewMemberModel(image: "Director", name: "Jon Watts", role: "Director"),
	CrewMemberModel(image: "Director", name: "Jon Watts", role: "Director")
 ]),
		Movie(title: "Fistful", date: "2004", image: "fistful", urlTrailer: "", rating: 3.2, timing: 212, responders: 45, category: "Fantasy", description: """
 Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book
 """, castCrew: [
	CrewMemberModel(image: "Director", name: "Jon Watts", role: "Director"),
	CrewMemberModel(image: "Director", name: "Jon Watts", role: "Director"),
	CrewMemberModel(image: "Director", name: "Jon Watts", role: "Director")
 ]),
		Movie(title: "Jurassic world", date: "2232", image: "", urlTrailer: "", rating: 5, timing: 215, responders: 115, category: "Adventure", description: """
 Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book 
 """
              , castCrew: [
	CrewMemberModel(image: "Director", name: "Jon Watts", role: "Director"),
	CrewMemberModel(image: "Director", name: "Jon Watts", role: "Director"),
	CrewMemberModel(image: "Director", name: "Jon Watts", role: "Director")
 ])
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
    
    func loudUserName() {
        profile.name = UserDefaults.standard.string(forKey: "firstName") ?? "" // можно попробовать прокинуть в инит
    }

}
