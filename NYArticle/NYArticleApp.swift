//
//  NYArticleApp.swift
//  NYArticle
//
//  Created by rakeshlohan on 19/02/24.
//

import SwiftUI

@main
struct NYArticleApp: App {
    var body: some Scene {
        WindowGroup {
            ArticleListView(viewModel: DependencyContainer.shared.makeArticleListViewModel())
        }
    }
}
