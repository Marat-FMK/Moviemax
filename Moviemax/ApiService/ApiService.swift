//
//  ApiService.swift
//  Moviemax
//
//  Created by Marat Fakhrizhanov on 29.04.2025.
//

import Foundation
import SwiftUI

class ApiService {
//    let link = "https://api.kinopoisk.dev/"
    let apiKey = "39FFZDY-7NWM6ZM-QN4P3EQ-42T55X1" // X-API-KEY -->> 39FFZDY-7NWM6ZM-QN4P3EQ-42T55X1

    
    func searchMovies(searchText: String, completion: @escaping ([ApiMovie]) -> Void) {
        
        guard let url = URL(string: "https://api.kinopoisk.dev/v1.4/movie/search") else {
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
}
