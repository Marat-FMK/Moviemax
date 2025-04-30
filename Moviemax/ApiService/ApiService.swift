//
//  ApiService.swift
//  Moviemax
//
//  Created by Marat Fakhrizhanov on 29.04.2025.
//

import Foundation
import SwiftUI

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
            URLQueryItem(name: "limit", value: "30"),
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
                print("Ошибка запроса: \(error!.localizedDescription)")
                completion([])
                return
            }
            
            guard let data = data else {
                print("Пустые данные")
                completion([])
                return
            }
            
            do {
                let decoded = try JSONDecoder().decode(Movies.self, from: data)
                DispatchQueue.main.async {
                    print(decoded.docs)
                    completion(decoded.docs)
                }
            } catch {
                print("Ошибка декодирования: \(error.localizedDescription)")
                completion([])
            }
        }.resume()
    }
    
    func fetchFilmInfo(id: Int, completion: @escaping (Movie?) -> Void ) {
        guard let url = URL(string: linkFilmIdInfo + String(id)) else {
            completion(nil)
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
                completion(nil)
                return
            }
            
            guard let data = data else {
                print("Пустые данные")
                completion(nil)
                return
            }
            
            do {
                let decoded = try JSONDecoder().decode(Movie.self, from: data)
                DispatchQueue.main.async {
                    print( "Detail Film INFO ----- >>> ", decoded)
                    completion(decoded)
                }
            } catch {
                print("Ошибка декодирования: \(error.localizedDescription)")
                completion(nil)
            }
        }.resume()
    }
    
}

