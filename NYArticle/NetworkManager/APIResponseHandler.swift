//
//  APIResponseHandler.swift
//  NYArticle
//
//  Created by rakeshlohan on 20/02/24.
//

import Foundation

class APIResponseHandler {
    
    func fetchModels<T: Codable>(type: T.Type, data: Data, completion: @escaping ((Result<T, NetworkError>) -> Void)) {
        
        if let response = try? JSONDecoder().decode(T.self, from: data) {
            completion(.success(response))
        } else {
            completion(.failure(.decodingFailed))
        }
    }
}
