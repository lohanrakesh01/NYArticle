//
//  DependencyContainer.swift
//  NYArticle
//
//  Created by rakeshlohan on 22/02/24.
//

import Foundation

class DependencyContainer {
    static let shared = DependencyContainer()
        
    private init() {}
    
    func makeArticleListViewModel() -> ArticleListViewModel {
        let apiService = APIService()
        let repository = ArticlesRepository(apiService: apiService)
        let fetchArticlesUseCase = FetchArticlesUseCase(repository: repository)
        
        return ArticleListViewModel(fetchArticlesUseCase: fetchArticlesUseCase)
    }
}
