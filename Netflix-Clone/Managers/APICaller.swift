//
//  APICaller.swift
//  Netflix-Clone
//
//  Created by Joao Matheus on 08/09/22.
//

import Foundation

enum Constants: String {
    case apiKey = "?api_key=eca46b71e0db1ad54a0261f6783df094"
    case language = "&language=en-US&"
    case page = "&page=1"
    case baseURL = "https://api.themoviedb.org/3"
    case endpointTrendingMovie = "/trending/movie/day"
    case endpointTrendingTv = "/trending/tv/day"
    case endpointUpcoming = "/movie/upcoming"
    case endpointPopular = "/movie/popular"
    case endpointTopRated = "/movie/top_rated"
}

enum APIError: Error {
    case failedToGetData
}

class APICaller {

    static let shared = APICaller()
    
    func fetchMovie(endpointURL: Constants, completion: @escaping (Result<[Movie], Error>) -> Void) {
        guard let url = URL(string: "\(Constants.baseURL.rawValue)\(endpointURL.rawValue)\(Constants.apiKey.rawValue)")
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
