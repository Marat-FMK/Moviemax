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

