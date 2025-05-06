//
//  MovieModel.swift
//  Moviemax
//
//  Created by Marat Fakhrizhanov on 08.04.2025.
//

import Foundation

// API universal model
//
//struct Movies: Codable {
//    let docs: [Movie]?
//}
//
//struct Movie: Codable, Identifiable, Equatable {
//    let lists: [String]?
//    let id: Int?
//    let externalId: ExternalID?
//    let name: String?
//    let alternativeName: String?
//    let names: [Title]?
//    let type: String?
//    let typeNumber: Int?
//    let year: Int?
//    let description: String?
//    let shortDescription: String?
//    let slogan: String?
//    let status: String?
//    let rating: Rating?
//    let votes: Votes?
//    let movieLength: Int?
//    let totalSeriesLength: Int?
//    let seriesLength: Int?
//    let ratingMpaa: String?
//    let ageRating: Int?
//    let poster: ImageData?
//    let backdrop: ImageData?
//    let genres: [SimpleName]?
//    let countries: [SimpleName]?
//    let budget: FeeData?
//    let fees: Fees?
//    let premiere: Premiere?
//    let ticketsOnSale: Bool?
//    let sequelsAndPrequels: [String]?
//    let releaseYears: [ReleaseYear]?
//    let top10: Int?
//    let top250: Int?
//    let isSeries: Bool?
//    let audience: [String]?
//    let deletedAt: String?
//    let facts: [String]?
//    let persons: [Person]?
//    
//    static func ==(lhs: Movie, rhs: Movie) -> Bool {
//            return lhs.id == rhs.id
//        }
//}
//
//struct ExternalID: Codable {
//    let kpHD: String?
//    let imdb: String?
//    let tmdb: Int?
//}
//
//struct Title: Codable {
//    let name: String?
//    let language: String?
//    let type: String?
//}
//
//struct Rating: Codable {
//    let kp: Double?
//    let imdb: Double?
//    let filmCritics: Double?
//    let russianFilmCritics: Double?
//    let await: Double?
//}
//
//struct Votes: Codable {
//    let kp: Int?
//    let imdb: Int?
//    let filmCritics: Int?
//    let russianFilmCritics: Int?
//    let await: Int?
//}
//
//struct ImageData: Codable {
//    let url: String?
//    let previewUrl: String?
//}
//
//struct SimpleName: Codable {
//    let name: String?
//}
//
//struct FeeData: Codable {
//    let value: Int? // или String? если там строка
//    let currency: String?
//}
//
//struct Fees: Codable {
//    let world: FeeData?
//    let russia: FeeData?
//    let usa: FeeData?
//}
//
//struct Premiere: Codable {
//    let bluray: String?
//    let cinema: String?
//    let digital: String?
//    let dvd: String?
//    let russia: String?
//    let world: String?
//}
//
//struct ReleaseYear: Codable {
//    let start: Int?
//    let end: Int?
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
//extension Movie {
//    static let empty = Movie(
//        lists: [],
//        id: 0,
//        externalId: ExternalID(kpHD: "", imdb: "", tmdb: 0),
//        name: "",
//        alternativeName: "",
//        names: [],
//        type: "",
//        typeNumber: 0,
//        year: 0,
//        description: "",
//        shortDescription: "",
//        slogan: "",
//        status: "",
//        rating: Rating(kp: 0.0, imdb: 0.0, filmCritics: 0.0, russianFilmCritics: 0.0, await: 0.0),
//        votes: Votes(kp: 0, imdb: 0, filmCritics: 0, russianFilmCritics: 0, await: 0),
//        movieLength: 0,
//        totalSeriesLength: 0,
//        seriesLength: 0,
//        ratingMpaa: "",
//        ageRating: 0,
//        poster: ImageData(url: "", previewUrl: ""),
//        backdrop: ImageData(url: "", previewUrl: ""),
//        genres: [],
//        countries: [],
//        budget: FeeData(value: 0, currency: ""),
//        fees: Fees(
//            world: FeeData(value: 0, currency: ""),
//            russia: FeeData(value: 0, currency: ""),
//            usa: FeeData(value: 0, currency: "")
//        ),
//        premiere: Premiere(bluray: "", cinema: "", digital: "", dvd: "", russia: "", world: ""),
//        ticketsOnSale: false,
//        sequelsAndPrequels: [],
//        releaseYears: [],
//        top10: 0,
//        top250: 0,
//        isSeries: false,
//        audience: [],
//        deletedAt: "",
//        facts: [],
//        persons: []
//    )
//}


//
//Dont work item model:
// 512769

struct Movies: Codable {
    let docs: [Movie]?
}

struct Movie: Codable, Identifiable, Equatable {
    let fees: Fees?
    let status: String?
    let externalId: ExternalID?
    let rating: Rating?
    let votes: Votes?
    let backdrop: ImageURLs?
    let movieLength: Int?
    let images: ImageCounts?
    let productionCompanies: [ProductionCompany]?
    let spokenLanguages: [Language]?
    let id: Int?
    let type: String?
    let name: String?
    let description: String?
    let distributors: Distributors?
    let premiere: PremiereDates?
    let slogan: String?
    let year: Int?
    let budget: Budget?
    let poster: ImageURLs?
    let facts: [Fact]?
    let genres: [SimpleName]?
    let countries: [Name]?
    let seasonsInfo: [SeasonInfo]?
    let persons: [Person]?
    let lists: [String]?
    let typeNumber: Int?
    let alternativeName: String?
    let enName: String?
    let names: [LocalizedName]?
    let updatedAt: String?
    let imagesInfo: ImageCounts?
    let sequelsAndPrequels: [Movie]?
    let similarMovies: [SimilarMovie]?
    let ratingMpaa: String?
    let shortDescription: String?
    let technology: Technology?
    let ticketsOnSale: Bool?
    let ageRating: Int?
    let logo: ImageURLs?
    let top10: Int?
    let top250: Int?
    let audience: [Audience]?
    let deletedAt: String?
    let isSeries: Bool?
    let seriesLength: Int?
    let totalSeriesLength: Int?
    let networks: [String]?
    let videos: Videos?
    let isTmdbChecked: Bool?
    let watchability: Watchability?
    let userRatingsParsed: Bool?
    
    static func ==(lhs: Movie, rhs: Movie) -> Bool {
                return lhs.id == rhs.id
            }
}

extension Movie {
    static let empty = Movie(
        fees: nil,
        status: nil,
        externalId: nil,
        rating: nil,
        votes: nil,
        backdrop: nil,
        movieLength: nil,
        images: nil,
        productionCompanies: nil,
        spokenLanguages: nil,
        id: nil,
        type: nil,
        name: nil,
        description: nil,
        distributors: nil,
        premiere: nil,
        slogan: nil,
        year: nil,
        budget: nil,
        poster: nil,
        facts: nil,
        genres: nil,
        countries: nil,
        seasonsInfo: nil,
        persons: nil,
        lists: nil,
        typeNumber: nil,
        alternativeName: nil,
        enName: nil,
        names: nil,
        updatedAt: nil,
        imagesInfo: nil,
        sequelsAndPrequels: nil,
        similarMovies: nil,
        ratingMpaa: nil,
        shortDescription: nil,
        technology: nil,
        ticketsOnSale: nil,
        ageRating: nil,
        logo: nil,
        top10: nil,
        top250: nil,
        audience: nil,
        deletedAt: nil,
        isSeries: nil,
        seriesLength: nil,
        totalSeriesLength: nil,
        networks: nil,
        videos: nil,
        isTmdbChecked: nil,
        watchability: nil,
        userRatingsParsed: nil
    )
}

// MARK: - Supporting Models

struct Fees: Codable {
    let world, russia, usa: Money?
}

struct Money: Codable {
    let value: Int?
    let currency: String?
}

struct ExternalID: Codable {
    let kpHD, imdb: String?
    let tmdb: Int?
}

struct Rating: Codable {
    let kp, imdb, filmCritics: Double?
    let russianFilmCritics: Int?
    let await: Double?
}

struct Votes: Codable {
    let kp, imdb: Int?
    let filmCritics, russianFilmCritics, await: Int?
}

struct ImageURLs: Codable {
    let url, previewUrl: String?
}

struct ImageCounts: Codable {
    let postersCount, backdropsCount, framesCount: Int?
}

struct ProductionCompany: Codable {
    let name: String?
    let url: String?
    let previewUrl: String?
}

struct Language: Codable {
    let name: String?
    let nameEn: String?
}

struct Distributors: Codable {
    let distributor: String?
    let distributorRelease: String?
}

struct PremiereDates: Codable {
    let world, russia, bluray, dvd, cinema, digital: String?
}

struct Budget: Codable {
    let value: Int?
    let currency: String?
}

struct Fact: Codable {
    let value: String?
    let type: String?
    let spoiler: Bool?
}

struct Name: Codable {
    let name: String?
}

struct SimpleName: Codable {
    let name: String?
}

struct SeasonInfo: Codable {} // пустая структура для сериалов

struct Person: Codable {
    let id: Int?
    let photo: String?
    let name, enName, description, profession, enProfession: String?
}

struct LocalizedName: Codable {
    let name: String?
    let language: String?
    let type: String?
}

struct SimilarMovie: Codable {
    let id: Int?
    let name, alternativeName, enName, type: String?
    let poster: ImageURLs?
    let rating: Rating?
    let year: Int?
}

struct Technology: Codable {
    let hasImax, has3D: Bool?
}

struct Audience: Codable {
    let count: Int?
    let country: String?
}

struct Videos: Codable {
    let trailers: [VideoItem]?
}

struct VideoItem: Codable {
    let url: String?
    let name: String?
    let site: String?
    let type: String?
}

struct Watchability: Codable {
    let items: [WatchItem]?
}

struct WatchItem: Codable {
    // расширить при необходимости
}
//
//struct Movie: Identifiable, Codable, Equatable {
//    let lists: [String]?
//    let id: Int?
//    let externalId: ExternalID?
//    let name: String?
//    let alternativeName: String?
//    let enName: String?
//    let names: [Title]?
//    let type: String?
//    let typeNumber: Int?
//    let year: Int?
//    let description: String?
//    let shortDescription: String?
//    let slogan: String?
//    let status: String?
//    let rating: Rating?
//    let votes: Votes?
//    let movieLength: Int?
//    let totalSeriesLength: Int?
//    let seriesLength: Int?
//    let ratingMpaa: String?
//    let ageRating: Int?
//    let poster: ImageData?
//    let backdrop: ImageData?
//    let genres: [SimpleName]?
//    let countries: [SimpleName]?
//    let budget: FeeData?
//    let fees: Fees?
//    let premiere: Premiere?
//    let ticketsOnSale: Bool?
//    let sequelsAndPrequels: [String]?
//    let top10: Int?
//    let top250: Int?
//    let isSeries: Bool?
//    let audience: [String]?
//    let deletedAt: String?
//    let facts: [Fact]?
//    let persons: [Person]?
//    let spokenLanguages: [String]?
//    let seasonsInfo: [String]?
//    let collections: [String]?
//    let productionCompanies: [String]?
//    let similarMovies: [SimilarMovie]?
//    let releaseYears: [ReleaseYear]?
//    let createdAt: String?
//    let updatedAt: String?
//    let networks: String?
//    let logo: ImageData?
//    let videos: Videos?
//    let isTmdbChecked: Bool?
//    let watchability: Watchability?
//    let userRatingsParsed: Bool?
//    
//    static func ==(lhs: Movie, rhs: Movie) -> Bool {
//                return lhs.id == rhs.id
//            }
//        
//}
//
//struct ExternalID: Codable {
//    let kpHD: String?
//    let imdb: String?
//    let tmdb: Int?
//}
//
//struct Title: Codable {
//    let name: String?
//    let language: String?
//    let type: String?
//}
//
//struct Rating: Codable {
//    let kp: Double?
//    let imdb: Double?
//    let filmCritics: Double?
//    let russianFilmCritics: Double?
//    let await: Double?
//}
//
//struct Votes: Codable {
//    let kp: Int?
//    let imdb: Int?
//    let filmCritics: Int?
//    let russianFilmCritics: Int?
//    let await: Int?
//}
//
//struct ImageData: Codable {
//    let url: String?
//    let previewUrl: String?
//}
//
//struct SimpleName: Codable {
//    let name: String?
//}
//
//struct FeeData: Codable {
//    let value: Int?
//    let currency: String?
//}
//
//struct Fees: Codable {
//    let world: FeeData?
//    let russia: FeeData?
//    let usa: FeeData?
//}
//
//struct Premiere: Codable {
//    let bluray: String?
//    let cinema: String?
//    let digital: String?
//    let dvd: String?
//    let russia: String?
//    let world: String?
//}
//
//struct ReleaseYear: Codable {
//    let start: Int?
//    let end: Int?
//}
//
//struct Fact: Codable {
//    let value: String?
//    let type: String?
//    let spoiler: Bool?
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
//    let enName: String?
//    let type: String?
//    let poster: ImageData?
//    let rating: Rating?
//    let year: Int?
//}
//
//struct Videos: Codable {
//    let trailers: [Trailer]?
//}
//
//struct Trailer: Codable {
//    let url: String?
//    let name: String?
//    let site: String?
//    let type: String?
//}
//
//struct Watchability: Codable {
//    let items: [String]?
//}
//
//extension Movie {
//    static let empty = Movie(
//        lists: [],
//        id: 0,
//        externalId: ExternalID(kpHD: "", imdb: "", tmdb: 0),
//        name: "",
//        alternativeName: "",
//        enName: "",
//        names: [],
//        type: "",
//        typeNumber: 0,
//        year: 0,
//        description: "",
//        shortDescription: "",
//        slogan: "",
//        status: "",
//        rating: Rating(kp: 0.0, imdb: 0.0, filmCritics: 0.0, russianFilmCritics: 0.0, await: 0.0),
//        votes: Votes(kp: 0, imdb: 0, filmCritics: 0, russianFilmCritics: 0, await: 0),
//        movieLength: 0,
//        totalSeriesLength: 0,
//        seriesLength: 0,
//        ratingMpaa: "",
//        ageRating: 0,
//        poster: ImageData(url: "", previewUrl: ""),
//        backdrop: ImageData(url: "", previewUrl: ""),
//        genres: [],
//        countries: [],
//        budget: FeeData(value: 0, currency: ""),
//        fees: Fees(
//            world: FeeData(value: 0, currency: ""),
//            russia: FeeData(value: 0, currency: ""),
//            usa: FeeData(value: 0, currency: "")
//        ),
//        premiere: Premiere(
//            bluray: "", cinema: "", digital: "", dvd: "", russia: "", world: ""
//        ),
//        ticketsOnSale: false,
//        sequelsAndPrequels: [],
//        top10: 0,
//        top250: 0,
//        isSeries: false,
//        audience: [],
//        deletedAt: "",
//        facts: [],
//        persons: [],
//        spokenLanguages: [],
//        seasonsInfo: [],
//        collections: [],
//        productionCompanies: [],
//        similarMovies: [],
//        releaseYears: [],
//        createdAt: "",
//        updatedAt: "",
//        networks: "",
//        logo: ImageData(url: "", previewUrl: ""),
//        videos: Videos(trailers: []),
//        isTmdbChecked: false,
//        watchability: Watchability(items: []),
//        userRatingsParsed: false
//    )
//}










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



