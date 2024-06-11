//
//  ApiClient.swift
//  TravelMate
//
//  Created by Ricardo Developer on 31/05/24.
//

import Foundation

enum APIError: Error {
    case networkError(Error)
    case decodingError(Error)
    case invalidResponse
    case unknownError
}

class APIClient {
    
    func travelData(for country: String, completion: @escaping (Result<TravelMate, APIError>) -> Void) {
        
        let headers = [
            "x-rapidapi-key": "e3f46a9e85mshacd119cd4964d6bp14da7djsnd4c05e14ba24",
            "x-rapidapi-host": "travel-info-api.p.rapidapi.com"
        ]
        
        guard let url = URL(string: "https://travel-info-api.p.rapidapi.com/country?country=\(country)") else {
            completion(.failure(.unknownError))
            return
        }
        
        var request = URLRequest(url: url, timeoutInterval: Double.infinity)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(.networkError(error)))
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
                completion(.failure(.invalidResponse))
                return
            }
            
            guard let data = data else {
                completion(.failure(.unknownError))
                return
            }
            
            do {
                let result = try JSONDecoder().decode(TravelMate.self, from: data)
                completion(.success(result))
            } catch {
                completion(.failure(.decodingError(error)))
            }
            
        }.resume()
    }
}
