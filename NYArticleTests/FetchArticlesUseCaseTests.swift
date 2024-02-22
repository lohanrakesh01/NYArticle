//
//  FetchArticlesUseCaseTests.swift
//  NYArticleTests
//
//  Created by rakeshlohan on 21/02/24.
//

import XCTest
@testable import NYArticle

final class FetchArticlesUseCaseTests: XCTestCase {
    
    func testFetchItems() {
        let mockRepository = MockArticleRepository()
        let fetchItemsUseCase = FetchArticlesUseCase(repository: mockRepository)
        
        fetchItemsUseCase.execute { items in
            XCTAssertEqual(items.count, 1) // Assuming mockRepository returns 1 item
        }
    }
}


// Mock Repository for testing
class MockArticleRepository: ArticlesRepositoryProtocol {
    func fetchArticles(completion: @escaping ([NYArticle.Article]) -> Void) {
        completion([
            Article(id: 1, source: "NY Article", publishedDate: "26-11-2023", section: "well", byline: "By Thomson", type: "", title: "", abstract: "", media: [ArticleMedia]())
        ])
    }
}
