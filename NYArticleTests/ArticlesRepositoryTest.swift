//
//  ArticlesRepositoryTest.swift
//  NYArticleTests
//
//  Created by rakeshlohan on 22/02/24.
//

import XCTest
@testable import NYArticle

final class ArticlesRepositoryTest: XCTestCase {

    func testFetchArticles() {
        
        let articlesRepository = ArticlesRepository(apiService: MockAPIService())
        
        articlesRepository.fetchArticles { items in
            XCTAssertEqual(items.count, 1)
        }
    }
}

class MockAPIService: APIServiceProtocol {
    
    func fetchArticles<T>(type: T.Type, completion: @escaping (Result<T, NYArticle.NetworkError>) -> Void) where T : Codable {
        if let model = loadMockData() {
            completion(.success(model as! T))
        }
        completion(.failure(.invalidResponse))
    }
    
    func loadMockData() -> [ArticleRepositoryListModel]? {
        if let url = Bundle.main.url(forResource: "ArticleJson", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let items = try JSONDecoder().decode([ArticleRepositoryListModel].self, from: data)
                return items
            } catch {
                print("Error decoding mock data: \(error)")
            }
        }
        return nil
    }
}
