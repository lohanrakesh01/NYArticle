//
//  ArticleDetailView.swift
//  NYArticle
//
//  Created by rakeshlohan on 20/02/24.
//

import SwiftUI

struct ArticleDetailView: View {
    var article: Article
    
    var imageSize = 200.0
    
    var body: some View {
        Text(article.title)
            .padding()
    }
}


