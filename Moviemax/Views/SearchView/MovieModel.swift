//
//  MovieModel.swift
//  Moviemax
//
//  Created by Marat Fakhrizhanov on 08.04.2025.
//

import Foundation

struct Movie {
    let title: String
    let time: String
    let date: String
    let image: String
    let urlTrailer: String
    var favorite: Bool
    let rating: Int
    let category: String
    let castAndCrew: String
    let id = UUID()
}

