//
//  ArticleView.swift
//  NYArticle
//
//  Created by rakeshlohan on 21/02/24.
//

import SwiftUI

struct ArticleView: View {
    var article: Article
    
    var imageSize = 48.0
    
    var body: some View {
        HStack {
            if let media = article.media.first, let url = URL(string: media.url) {
                AsyncImage(url: url){ image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                } placeholder: {
                    Image(systemName: "circle.fill")
                        .resizable()
                        .frame(width: imageSize, height: imageSize)
                        .foregroundColor(ColorConstant.greyColor)
                }
                .frame(width: imageSize, height: imageSize)
                .cornerRadius(imageSize / 2)
                .overlay(
                    Circle()
                        .stroke(Color.white, lineWidth: 0.0)
                        .frame(width: imageSize, height: imageSize)
                )
            }
            
            VStack(alignment: .leading, spacing: 0.0) {
                Text(article.title)
                    .lineLimit(2)
                
                Text(article.byline)
                    .padding(.top)
                    .foregroundColor(ColorConstant.greyColor)
                
                HStack {
                    
                    Spacer()
                    
                    Image(systemName: "calendar")
                        .resizable()
                        .frame(width: 16.0, height: 16.0)
                    
                    Text(article.publishedDate)
                        .font(.system(size: 12.0))
                }
                .foregroundColor(ColorConstant.greyColor)
            }.padding(.leading, 16.0)
        }
    }
}
