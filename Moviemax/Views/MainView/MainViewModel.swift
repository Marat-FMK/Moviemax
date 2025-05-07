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

	@Published var categories = ["All", "комедия", "драма", "детектив", "боевик", "криминал", "приключения"]
	@Published var choosenCategory = "All"

	@Published var favoriteFilmIDs: Set<String> = UserDefaults.standard.favoriteFilmIDs {
		didSet {
			UserDefaults.standard.favoriteFilmIDs = favoriteFilmIDs
		}
	}

	@Published var currentIndex: Int = 1
	@Published var profile = ProfileModel(name: "User Name", avatar: "avatar")

    @Published var currentCategoryMovies: [Movie] = []
    @Published var caruselMovies: [Movie] = []
    var allMovies: [Movie] = []


    //MARK: - API FUNC's
    func fetchMainFilms() {
        ApiService().searchMovies(searchText: "Simpsons") { movies in
            var currentMovies: [Movie] = []
            for movie in movies {
                if movie.description != nil && movie.description != "" && movie.poster?.url != nil && movie.name != "" && movie.movieLength != nil && movie.genres != nil{
                    currentMovies.append(movie)
                }
            }
            DispatchQueue.main.async {
                self.allMovies = currentMovies
                self.caruselMovies = self.setCaruselMovies()
                self.updateCurrentCategoryMovies()
            }
        }
    }
    
    
    func updateCurrentCategoryMovies() {
            if choosenCategory == "All" {
                currentCategoryMovies = allMovies
            } else {
                currentCategoryMovies = allMovies.filter{ checkGenreInMovie(genre: $0.genres ?? [])} // ??
            }
    }
    
    func checkGenreInMovie(genre: [SimpleName]) -> Bool{
            var bool = false
            for genre in genre {
                if genre.name == choosenCategory {
                    bool = true
                }
            }
            return bool
    }
    
    func setCaruselMovies()-> [Movie] {
        var movies: [Movie] = []
        for i in 0 ..< 3 {
            movies.append(self.allMovies[i])
        }
        return movies
    }
    
    
    //MARK: - VIEW FUNC's
	func checkCategoryName(category: String) -> Bool {
		choosenCategory == category
	}

	func chooseCategory(category: String) {
		choosenCategory = category
        updateCurrentCategoryMovies()
	}

	func isFavorite(movie: Movie) -> Bool {
//		favoriteFilmIDs.contains(movie.id.uuidString)
        return false
	}

	func toggleFavorite(movie: Movie) {
//		let filmID = movie.id.uuidString
//		if favoriteFilmIDs.contains(filmID) {
//			favoriteFilmIDs.remove(filmID)
//		} else {
//			favoriteFilmIDs.insert(filmID)
//		}
	}
    
    func loudUserName() {
        profile.name = UserDefaults.standard.string(forKey: "firstName") ?? "" // можно попробовать прокинуть в инит
    }

}











//

//[
//    Movie(title: "Drifting Home", date: "2005", image: "drifting", urlTrailer: "", rating: 5.1, timing: 112, responders: 105, category: "All", description: """
//Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.
//""", castCrew: [
//CrewMemberModel(image: "Director", name: "Jon Watts", role: "Director"),
//CrewMemberModel(image: "Director", name: "Jon Watts", role: "Director"),
//CrewMemberModel(image: "Director", name: "Jon Watts", role: "Director")
//]),
//    Movie(title: "Luck", date: "2002", image: "luck", urlTrailer: "", rating: 4.4, timing: 148, responders: 54, category: "Adventure", description: """
//Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book 
//""", castCrew: [
//CrewMemberModel(image: "Director", name: "Jon Watts", role: "Director"),
//CrewMemberModel(image: "Director", name: "Jon Watts", role: "Director"),
//CrewMemberModel(image: "Director", name: "Jon Watts", role: "Director")
//]),
//    Movie(title: "Fistful", date: "2004", image: "fistful", urlTrailer: "", rating: 3.2, timing: 212, responders: 45, category: "Fantasy", description: """
//Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book
//""", castCrew: [
//CrewMemberModel(image: "Director", name: "Jon Watts", role: "Director"),
//CrewMemberModel(image: "Director", name: "Jon Watts", role: "Director"),
//CrewMemberModel(image: "Director", name: "Jon Watts", role: "Director")
//]),
//    Movie(title: "Jurassic world", date: "2232", image: "", urlTrailer: "", rating: 5, timing: 215, responders: 115, category: "Adventure", description: """
//Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book 
//"""
//          , castCrew: [
//CrewMemberModel(image: "Director", name: "Jon Watts", role: "Director"),
//CrewMemberModel(image: "Director", name: "Jon Watts", role: "Director"),
//CrewMemberModel(image: "Director", name: "Jon Watts", role: "Director")
//])
//]
