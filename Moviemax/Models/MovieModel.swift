//
//  MovieModel.swift
//  Moviemax
//
//  Created by Marat Fakhrizhanov on 08.04.2025.
//

import Foundation

// API universal model

struct Movies: Codable {
    let docs: [Movie]?
}

struct Movie: Codable, Identifiable, Equatable {
    let lists: [String]?
    let id: Int?
    let externalId: ExternalID?
    let name: String?
    let alternativeName: String?
    let names: [Title]?
    let type: String?
    let typeNumber: Int?
    let year: Int?
    let description: String?
    let shortDescription: String?
    let slogan: String?
    let status: String?
    let rating: Rating?
    let votes: Votes?
    let movieLength: Int?
    let totalSeriesLength: Int?
    let seriesLength: Int?
    let ratingMpaa: String?
    let ageRating: Int?
    let poster: ImageData?
    let backdrop: ImageData?
    let genres: [SimpleName]?
    let countries: [SimpleName]?
    let budget: FeeData?
    let fees: Fees?
    let premiere: Premiere?
    let ticketsOnSale: Bool?
    let sequelsAndPrequels: [String]?
    let releaseYears: [ReleaseYear]?
    let top10: Int?
    let top250: Int?
    let isSeries: Bool?
    let audience: [String]?
    let deletedAt: String?
    let facts: [String]?
    let persons: [Person]?
    
    static func ==(lhs: Movie, rhs: Movie) -> Bool {
            return lhs.id == rhs.id
        }
}

struct ExternalID: Codable {
    let kpHD: String?
    let imdb: String?
    let tmdb: Int?
}

struct Title: Codable {
    let name: String?
    let language: String?
    let type: String?
}

struct Rating: Codable {
    let kp: Double?
    let imdb: Double?
    let filmCritics: Double?
    let russianFilmCritics: Double?
    let await: Double?
}

struct Votes: Codable {
    let kp: Int?
    let imdb: Int?
    let filmCritics: Int?
    let russianFilmCritics: Int?
    let await: Int?
}

struct ImageData: Codable {
    let url: String?
    let previewUrl: String?
}

struct SimpleName: Codable {
    let name: String?
}

struct FeeData: Codable {
    let value: Int? // или String? если там строка
    let currency: String?
}

struct Fees: Codable {
    let world: FeeData?
    let russia: FeeData?
    let usa: FeeData?
}

struct Premiere: Codable {
    let bluray: String?
    let cinema: String?
    let digital: String?
    let dvd: String?
    let russia: String?
    let world: String?
}

struct ReleaseYear: Codable {
    let start: Int?
    let end: Int?
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

extension Movie {
    static let empty = Movie(
        lists: [],
        id: 0,
        externalId: ExternalID(kpHD: "", imdb: "", tmdb: 0),
        name: "",
        alternativeName: "",
        names: [],
        type: "",
        typeNumber: 0,
        year: 0,
        description: "",
        shortDescription: "",
        slogan: "",
        status: "",
        rating: Rating(kp: 0.0, imdb: 0.0, filmCritics: 0.0, russianFilmCritics: 0.0, await: 0.0),
        votes: Votes(kp: 0, imdb: 0, filmCritics: 0, russianFilmCritics: 0, await: 0),
        movieLength: 0,
        totalSeriesLength: 0,
        seriesLength: 0,
        ratingMpaa: "",
        ageRating: 0,
        poster: ImageData(url: "", previewUrl: ""),
        backdrop: ImageData(url: "", previewUrl: ""),
        genres: [],
        countries: [],
        budget: FeeData(value: 0, currency: ""),
        fees: Fees(
            world: FeeData(value: 0, currency: ""),
            russia: FeeData(value: 0, currency: ""),
            usa: FeeData(value: 0, currency: "")
        ),
        premiere: Premiere(bluray: "", cinema: "", digital: "", dvd: "", russia: "", world: ""),
        ticketsOnSale: false,
        sequelsAndPrequels: [],
        releaseYears: [],
        top10: 0,
        top250: 0,
        isSeries: false,
        audience: [],
        deletedAt: "",
        facts: [],
        persons: []
    )
}

//struct Movie: Identifiable, Codable {
//    let id: Int?
//    let name: String?
//    let alternativeName: String?
//    let year: Int?
//    let description: String?
//    let genres: [Genre]?
//    let movieLenght: Int?
//    let rating: Rating?
//    let poster: Poster?
//    let createdAt: String?
//    let fees: Fees?
//    let premiere: Premiere?
//    let persons: [Person]?
//    let similarMovies: [SimilarMovie]?
//    let videos: Videos?
//}
//
//struct Genre: Codable {
//    let name: String?
//}
//
//struct Rating: Codable {
//    let imdb: Double?
//}
//
//struct Poster: Codable {
//    let url: String?
//}
//
//struct Fees: Codable {
//    let world: Income?
//}
//struct Income: Codable {
//    let value: Int?
//    let currency: String?
//}
//
//struct Premiere: Codable {
//    let world: String?
//    let russia: String?
//}
//
//struct Person: Codable {
//    let id: Int?
//    let photo: String?
//    let name: String?
//    let enName: String?
//    let description: String?
//    let profession: String?
//    let enProfession: String?
//}
//
//struct SimilarMovie: Codable {
//    let id: Int?
//    let name: String?
//    let alternativeName: String?
//    let poster: Poster?
//}
//
//struct Videos: Codable {
//    let trailers: Trailer?
//}
//struct Trailer: Codable {
//    let url: String?
//    let name: String?
//    let site: String?
//    let type: String?
//}


// // // //

//struct Movie: Identifiable, Equatable {
//    let id = UUID()
//    let title: String
//    let date: String
//    let image: String
//    let urlTrailer: String
//    let rating: Double
//    let timing: Int
//    let responders: Int
//    let category: String
//    let description: String
//    let castCrew: [CrewMemberModel]
//}
//
//struct CrewMemberModel: Hashable, Equatable{
//    let image: String
//    let name: String
//    let role: String
//}



