//
//  APICaller.swift
//  Netflix-Clone
//
//  Created by Joao Matheus on 08/09/22.
//

import Foundation

struct Constants {
    static let apiKey = ""
    static let baseURL = "https://api.themoviedb.org/"
    static let endpointTrendingMovie = "/3/trending/movie/day"
    static let endpointTrendingTv = "/3/trending/tv/day"
}

enum APIError: Error {
    case failedToGetData
}

class APICaller {

    static let shared = APICaller()
    
    func trendingMovies(completion: @escaping (Result<[Movie], Error>) -> Void) {
        
        guard let url = URL(string: "\(Constants.baseURL)\(Constants.endpointTrendingMovie)\(Constants.apiKey)") else { return }
        
        executeRequest(url, TrendingMovies.self) { result in
            switch result {
            case .success(let results):
                completion(.success(results.results))
            case .failure(let error):
                completion(.failure(error))
            }
        }

    }
    
    func trendingTvs(completion: @escaping (Result<[Movie], Error>) -> Void) {
        guard let url = URL(string: "\(Constants.baseURL)\(Constants.endpointTrendingTv)\(Constants.apiKey)") else { return }
        
        executeRequest(url, TrendingTvs.self) { result in
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
