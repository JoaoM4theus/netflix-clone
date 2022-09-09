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
    
    func trendingMovies(completion: @escaping (String) -> Void) {
        
        guard let url = URL(string: "\(Constants.baseURL)\(Constants.endpointTrending)\(Constants.apiKey)") else { return }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            
            guard let data = data, error == nil else { return }
            
            do {
                let result = try JSONSerialization.jsonObject(with: data, options: .fragmentsAllowed)
                print(result)
            } catch {
                print(error.localizedDescription)
            }

            
        }
        
        task.resume()
    }

}
