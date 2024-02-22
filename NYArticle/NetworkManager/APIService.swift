//
//  APIService.swift
//  NYArticle
//
//  Created by rakeshlohan on 19/02/24.
//

import Foundation
import Combine

enum NetworkError: Error {
    case invalidURL
    case requestFailed(Error)
    case invalidResponse
    case decodingFailed
}

protocol APIServiceProtocol {
    func fetchArticles<T: Codable>(type: T.Type, completion: @escaping (Result<T, NetworkError>) -> Void)
}

class APIService: APIServiceProtocol {
    
    let apiHandler: APIHandler
    let responseHandler: APIResponseHandler
    
    init(apiHandler: APIHandler = APIHandler(), responseHandler: APIResponseHandler = APIResponseHandler()) {
        self.apiHandler = apiHandler
        self.responseHandler = responseHandler
    }
    
    func fetchArticles<T: Codable>(type: T.Type, completion: @escaping (Result<T, NetworkError>) -> Void) {
        
        guard let url = URL(string: "https://api.nytimes.com/svc/mostpopular/v2/mostviewed/all-sections/7.json?api-key=eyLOO6VxobE0dblvAmrCidjCmpA7Dqhz") else {
            return completion(.failure(.invalidURL))
        }
        
        apiHandler.getArticle(url: url) { result in
            
            switch result {
            case .success(let data):
                self.responseHandler.fetchModels(type: type, data: data) { decodedResult in
                    
                    switch decodedResult {
                    case .success(let model):
                        completion(.success(model))
                        
                    case .failure(let error):
                        completion(.failure(error))
                    }
                    
                }
                
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
