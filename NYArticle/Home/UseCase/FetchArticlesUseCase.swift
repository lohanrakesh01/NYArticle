//
//  FetchArticlesUseCase.swift
//  NYArticle
//
//  Created by rakeshlohan on 19/02/24.
//

import Foundation

class FetchArticlesUseCase {
    let repository: ArticlesRepositoryProtocol
    
    init(repository: ArticlesRepositoryProtocol) {
        self.repository = repository
    }
    
    func execute(completion: @escaping ([Article]) -> Void) {
        repository.fetchArticles(completion: completion)
    }
}
