//
//  ArticleListViewModelTests.swift
//  NYArticleTests
//
//  Created by rakeshlohan on 21/02/24.
//

import XCTest
@testable import NYArticle

final class ArticleListViewModelTests: XCTestCase {

    func testFetchArticles() {
        let mockUseCase = MockFetchArticlesUseCase(repository: MockArticleRepository())
        let viewModel = ArticleListViewModel(fetchArticlesUseCase: mockUseCase)
            
        viewModel.fetchArticles()
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            XCTAssertEqual(viewModel.articles.count, 1) // Assuming mockUseCase returns 1 item
        }
    }
}

// Mock FetchItemsUseCase for testing
class MockFetchArticlesUseCase: FetchArticlesUseCase {
    override func execute(completion: @escaping ([Article]) -> Void) {
        // Mock implementation returning some items
        completion([
            Article(id: 1, source: "NY Article", publishedDate: "26-11-2023", section: "well", byline: "By Thomson", type: "", title: "", abstract: "", media: [ArticleMedia]())
        ])
    }
}
