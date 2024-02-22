//
//  Article.swift
//  NYArticle
//
//  Created by rakeshlohan on 20/02/24.
//

import Foundation

struct Article: Identifiable {
    let id: Int
    let source, publishedDate, section: String
    let byline, type, title, abstract: String
    let media: [ArticleMedia]
}


struct ArticleMedia {
    let url: String
    let format: String
    let height, width: Int
}

