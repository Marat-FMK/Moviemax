//
//  MovieModel.swift
//  Moviemax
//
//  Created by Marat Fakhrizhanov on 08.04.2025.
//

import Foundation

//struct Movie: Identifiable, Equatable {
//	let id = UUID()
//	let title: String
//	let date: String
//	let image: String
//	let urlTrailer: String
//	let rating: Double
//	let timing: Int
//	let responders: Int
//	let category: String
//	let description: String
//	let castCrew: [CrewMemberModel]
//}
//
//struct CrewMemberModel: Hashable, Equatable{
//	let image: String
//	let name: String
//	let role: String
//}



// API universal model

struct Movies: Codable {
    let docs: [Movie]
}

struct Movie: Identifiable, Codable {
    let id: Int?
    let name: String?
    let alternativeName: String?
    let year: Int?
    let description: String?
    let genres: [Genre]?
    let movieLenght: Int?
    let rating: Rating?
    let poster: Poster?
    let createdAt: String?
    let fees: Fees?
    let premiere: Premiere?
    let persons: [Person]?
    let similarMovies: [SimilarMovie]?
    let videos: Videos?
}

struct Genre: Codable {
    let name: String?
}

struct Rating: Codable {
    let imdb: Double?
}

struct Poster: Codable {
    let url: String?
}

struct Fees: Codable {
    let world: Income?
}
struct Income: Codable {
    let value: Int?
    let currency: String?
}

struct Premiere: Codable {
    let world: String?
    let russia: String?
}

struct Person: Codable {
    let id: Int?
    let photo: String?
    let name: String?
    let enName: String?
    let description: String?
    let profession: String?
    let enProfession: String?
}

struct SimilarMovie: Codable {
    let id: Int?
    let name: String?
    let alternativeName: String?
    let poster: Poster?
}

struct Videos: Codable {
    let trailers: Trailer?
}
struct Trailer: Codable {
    let url: String?
    let name: String?
    let site: String?
    let type: String?
}


