//
//  ArticleRepository.swift
//  NYArticle
//
//  Created by rakeshlohan on 19/02/24.
//

import Foundation

protocol ArticlesRepositoryProtocol {
    func fetchArticles(completion: @escaping ([Article]) -> Void)
}

class ArticlesRepository: ArticlesRepositoryProtocol {
    let apiService: APIServiceProtocol
    
    init(apiService: APIServiceProtocol) {
        self.apiService = apiService
    }
    
    func fetchArticles(completion: @escaping ([Article]) -> Void) {
        apiService.fetchArticles(type: ArticleRepositoryListModel.self) { result in
            switch result {
            case .success(let model):
                let articles = model.results.map { article in
                    var medias = [ArticleMedia]()
                    if let mediaMetadata = article.media.first?.mediaMetadata {
                        for media in mediaMetadata {
                            medias.append(ArticleMedia(url: media.url,
                                                       format: media.format,
                                                       height: media.height,
                                                       width: media.width))
                        }
                    }
                    return Article(id: article.id,
                                   source: article.source,
                                   publishedDate: article.publishedDate,
                                   section: article.section,
                                   byline: article.byline,
                                   type: article.type,
                                   title: article.title,
                                   abstract: article.abstract,
                                   media: medias)
                    
                }
                
                completion(articles)
                
            case .failure(let error):
                debugPrint("Error:- \(error)")
            }
        }
    }
}
