//
//  ApiService.swift
//  Moviemax
//
//  Created by Marat Fakhrizhanov on 29.04.2025.
//

import Foundation
import SwiftUI

enum NetworkError: String, Error {
    case url = "bad url"
    case data = "no data in request"
    case decode = "error in decode model from json"
    case request = "request error"
}
class ApiService {

    // https://kinopoisk.dev/
    let linkForSearch = "https://api.kinopoisk.dev/v1.4/movie/search"
    let linkFilmIdInfo = "https://api.kinopoisk.dev/v1.4/movie/" //+FilmID
    let apiKey = "39FFZDY-7NWM6ZM-QN4P3EQ-42T55X1" // header X-API-KEY -->> 39FFZDY-7NWM6ZM-QN4P3EQ-42T55X1 limit  // 200requests/day
    
    func searchMovies(searchText: String, completion: @escaping ([Movie]) -> Void) {
        
        guard let url = URL(string: linkForSearch) else {
            completion([])
            return
        }
        
        var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: true)
        urlComponents?.queryItems = [
            URLQueryItem(name: "page", value: "1"),
            URLQueryItem(name: "limit", value: "50"),
            URLQueryItem(name: "query", value: searchText)
        ]
        
        guard let finalURL = urlComponents?.url else {
            completion([])
            return
        }
        
        var request = URLRequest(url: finalURL)
        request.httpMethod = "GET"
        request.timeoutInterval = 10
        request.allHTTPHeaderFields = [
            "accept": "application/json",
            "X-API-KEY": apiKey
        ]
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard error == nil else {
                print("Ошибка запроса text: \(error!.localizedDescription)")
                completion([])
                return
            }
            
            guard let data = data else {
                print("Пустые данные text")
                completion([])
                return
            }
            
            do {
                let decoded = try JSONDecoder().decode(Movies.self, from: data)
                DispatchQueue.main.async {
                    completion(decoded.docs ?? [])
                }
            } catch {
                print("Ошибка декодирования text: \(error.localizedDescription)")
                completion([])
            }
        }.resume()
    }
    
    func fetchFilmInfo(id: Int, completion: @escaping ( Result<Movie,NetworkError> ) -> Void ) {
        
        guard let url = URL(string: linkFilmIdInfo + String(id)) else {
            completion(.failure(.url))
            return
        }
        
      
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.timeoutInterval = 10
        request.allHTTPHeaderFields = [
            "accept": "application/json",
            "X-API-KEY": apiKey
        ]
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard error == nil else {
                print("Ошибка запроса: \(error!.localizedDescription)")
                completion(.failure(.request))
                return
            }
            
            guard let data = data else {
                print("Пустые данные")
                completion(.failure(.data))
                return
            }
            
            do {
                let movie = try JSONDecoder().decode(Movie.self, from: data)
                DispatchQueue.main.async {
                    print( "Detail Film INFO ----- >>> ", movie)
                    completion(.success(movie))
                }
            } catch {
                print("Ошибка декодирования: \(error.localizedDescription)")
                completion(.failure(.decode))
            }
        }.resume()
    }
    
}

