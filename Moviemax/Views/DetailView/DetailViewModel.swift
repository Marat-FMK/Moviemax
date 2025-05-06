//
//  DetailViewModel.swift
//  Moviemax
//
//  Created by Julia Martcenko on 04/04/2025.
//

import Foundation

class DetailViewModel: ObservableObject {
    @Published var movie: Movie = Movie.empty
    @Published var isFavorite: Bool = false
    
    @Published var movieCrew: [Person] = []
    @Published var movieCrewPrew: [Person] = []


    func fetchFullInfoAboutFilm(id: Int) {
        
        ApiService().fetchFilmInfo(id: id) { result in
            
            switch result {
            case .failure(let error): print("❌Movie ID --->>> \(id)");print(error)
            case .success(let movie): self.movie = movie ; print("✅ movie --->>>\(id)") ; self.setPersons()/*; print(self.movieCrew)*/
            }
        }
//        setPersons()
    }
    
    func setPersons() {
        guard let moviePersons = self.movie.persons else { return }
        var tempPersons = [Person]()
        
        switch moviePersons.count {
        case 0: tempPersons = []
        case 1: tempPersons = [moviePersons[0]]
        case 2: tempPersons = [moviePersons[0], moviePersons[1]]
        case 3: tempPersons = [moviePersons[0], moviePersons[1], moviePersons[2]]
        default: tempPersons = [moviePersons[0], moviePersons[1], moviePersons[2]]
        }
        
        self.movieCrew = moviePersons
        self.movieCrewPrew = tempPersons
    }
    
    
	func changeFavorite() {
//		UserDefaults.standard.toggleFavorite(filmID: movie.id.uuidString)
		isFavorite.toggle()
	}
}
