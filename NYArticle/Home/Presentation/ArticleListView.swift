//
//  ArticleListView.swift
//  NYArticle
//
//  Created by rakeshlohan on 19/02/24.
//

import SwiftUI

struct ArticleListView: View {
    @ObservedObject var viewModel: ArticleListViewModel
    
    var body: some View {
        NavigationView {
            VStack {
                switch viewModel.state {
                case .isLoading:
                    ProgressView("Loading...")
                    
                case .dataFetched:
                    List(viewModel.articles) { article in
                        NavigationLink(destination: ArticleDetailView(article: article)) {
                            ArticleView(article: article)
                                .padding(.bottom, 16.0)
                                .listRowBackground(ColorConstant.lightGreyColor)
                        }
                        .listRowSeparator(.hidden)
                    }
                    .listStyle(PlainListStyle())
                }
            }
            .onAppear {
                viewModel.fetchArticles()
            }
            .navigationTitle("NY Times Most Populer")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarLeading) {
                    Button(action: {
                        // handle tap
                    }) {
                        Image(systemName: "sidebar.squares.right")
                    }
                }
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    Button(action: {
                        // handle tap
                    }) {
                        Image(systemName: "magnifyingglass")
                    }
                    Button(action: {
                        // handle tap
                    }) {
                        Image(systemName: "sidebar.squares.left")
                    }
                }
            }
            .toolbarColorScheme(.dark, for: .navigationBar)
            .toolbarBackground(ColorConstant.navBarColor, for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
        }
    }
}



