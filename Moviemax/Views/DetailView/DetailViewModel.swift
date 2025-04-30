//
//  DetailViewModel.swift
//  Moviemax
//
//  Created by Julia Martcenko on 04/04/2025.
//

import Foundation

class DetailViewModel: ObservableObject {
    
    var filmId: Int
	@Published var movie: Movie = Movie(id: nil, name: nil, alternativeName: nil, year: nil, description: nil, genres: nil, movieLenght: nil, rating: nil, poster: nil, createdAt: nil, fees: nil, premiere: nil, persons: nil, similarMovies: nil, videos: nil)
	
    @Published var isFavorite: Bool = false
    
    @Published var persons: [Person] = []
    
    
    init(id: Int) {
        //        self.isFavorite = UserDefaults.standard.isFavorite(filmID: movie.id.uuidString) // Если используется сохранение в UserDefaults
        self.filmId = id
    }
    
    
    
    func fetchFullInfoAboutFilm(id: Int) {
        ApiService().fetchFilmInfo(id: id) { currentMovie in
            guard let currentMovie = currentMovie else { return }
            self.movie = currentMovie
        }
        setPersons()
    }
    
    func setPersons() {
        guard let moviePersons = movie.persons else { return }
        
        var tempPersons = [Person]()
        switch moviePersons.count {
        case 0: tempPersons = []
        case 1: tempPersons = [moviePersons[0]]
        case 2: tempPersons = [moviePersons[0], moviePersons[1]]
        case 3: tempPersons = [moviePersons[0], moviePersons[1], moviePersons[2]]
        default: tempPersons = [moviePersons[0], moviePersons[1], moviePersons[2]]
        }
        self.persons = tempPersons
    }
    
	func changeFavorite() {
//		UserDefaults.standard.toggleFavorite(filmID: movie.id.uuidString)
		isFavorite.toggle()
	}
}
