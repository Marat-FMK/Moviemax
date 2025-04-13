//
//  DetailViewModel.swift
//  Moviemax
//
//  Created by Julia Martcenko on 04/04/2025.
//

import Foundation

class DetailViewModel: ObservableObject {
	@Published var film: FilmModel = FilmModel(id: UUID(), image: "luck", title: "Luck", date: .now, rating: 4, timing: 148, category: "Action", description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book ", castCrew: [CrewMemberModel(image: "Director", name: "Jon Watts", role: "Director"), CrewMemberModel(image: "Director", name: "Jon Watts", role: "Director"), CrewMemberModel(image: "Director", name: "Jon Watts", role: "Director")])

	@Published var isFavorite: Bool = false

	func changeFavorite() {
		UserDefaults.standard.toggleFavorite(filmID: film.id.uuidString)
		isFavorite.toggle()
	}
}
