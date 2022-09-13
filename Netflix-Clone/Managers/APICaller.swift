//
//  APICaller.swift
//  Netflix-Clone
//
//  Created by Joao Matheus on 08/09/22.
//

import Foundation

struct Constants {
    static let apiKey = ""
    static let endpointTrendingMovie = "/trending/movie/day"
    static let endpointTrendingTv = "/trending/tv/day"
    static let endpointUpcoming = "/movie/upcoming"
    static let endpointPopular = "/movie/popular"
    static let endpointTopRated = "/movie/top_rated"
}

enum APIError: Error {
    case failedToGetData
}

class APICaller {

    static let shared = APICaller()
    
    func fetchMovie(endpointURL: String,
                    hasLaguange: Bool = false,
                    hasPage: Bool = false,
                    completion: @escaping (Result<[Movie], Error>) -> Void) {
        
        var urlString = "https://api.themoviedb.org/3\(endpointURL)\(Constants.apiKey)"
        
        if hasLaguange {
            urlString += "&language=en-US"
        }
        if hasPage {
            urlString += "&page=1"
        }
        
        guard let url = URL(string: urlString)
        else {
            return
        }
        
        executeRequest(url, Movies.self) { result in
            switch result {
            case .success(let results):
                completion(.success(results.results))
            case .failure(let error):
                completion(.failure(error))
            }
        }

    }
    
    func executeRequest<T>(_ url: URL, _ decoder: T.Type, completion: @escaping (Result<T, APIError>) -> Void) where T: Decodable {
        
        let _ = URLSession.shared.dataTask(with: url) { data, response, error in
            
            guard let data = data, error == nil else { return }
            
            do {
                let result = try JSONDecoder().decode(decoder, from: data)
                completion(.success(result))
            } catch {
                completion(.failure(.failedToGetData))
            }
            
        }.resume()
        
    }

}
