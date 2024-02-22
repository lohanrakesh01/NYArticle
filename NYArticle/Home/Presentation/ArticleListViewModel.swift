//
//  ArticleListViewModel.swift
//  NYArticle
//
//  Created by rakeshlohan on 19/02/24.
//

import Foundation

enum ViewState {
    case isLoading
    case dataFetched
}

class ArticleListViewModel: ObservableObject {
    
    @Published var articles: [Article] = []
    @Published var state: ViewState = .isLoading
    
    let fetchArticlesUseCase: FetchArticlesUseCase
    
    init(fetchArticlesUseCase: FetchArticlesUseCase) {
        self.fetchArticlesUseCase = fetchArticlesUseCase
    }
    
    func fetchArticles() {
        fetchArticlesUseCase.execute { articles in
            DispatchQueue.main.async {
                self.articles = articles
                self.state = .dataFetched
            }
        }
    }
}
