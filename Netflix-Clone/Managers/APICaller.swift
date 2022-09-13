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
    static let endpointTrending = "/3/trending/all/day"
}

class APICaller {

    static let shared = APICaller()
    
    func trendingMovies(completion: @escaping (Result<TrendingMoviesResponse, Error>) -> Void) {
        
        guard let url = URL(string: "\(Constants.baseURL)\(Constants.endpointTrending)\(Constants.apiKey)") else { return }
        
        executeRequest(url, TrendingMoviesResponse.self) { result in
            switch result {
            case .success(let trending):
                completion(.success(trending))
            case .failure(let error):
                completion(.failure(error))
            }
        }

    }
    
    func executeRequest<T>(_ url: URL, _ decoder: T.Type, completion: @escaping (Result<T, Error>) -> Void) where T: Decodable {
        
        let _ = URLSession.shared.dataTask(with: url) { data, response, error in
            
            guard let data = data, error == nil else { return }
            
            do {
                let result = try JSONDecoder().decode(decoder, from: data)
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
            
        }.resume()
        
    }

}
