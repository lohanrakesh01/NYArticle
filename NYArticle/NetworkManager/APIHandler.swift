//
//  APIHandler.swift
//  NYArticle
//
//  Created by rakeshlohan on 20/02/24.
//

import Foundation

class APIHandler {
    func getArticle(url: URL, completion: @escaping (Result<Data, NetworkError>) -> Void) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                return completion(.failure(.invalidResponse))
            }
            
            completion(.success(data))
        }.resume()
    }
}
