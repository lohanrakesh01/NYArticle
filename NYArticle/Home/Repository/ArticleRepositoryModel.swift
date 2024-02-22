//
//  ArticleRepositoryModel.swift
//  NYArticle
//
//  Created by rakeshlohan on 19/02/24.
//

import Foundation

struct ArticleRepositoryListModel: Codable {
    let status, copyright: String
    let numResults: Int
    let results: [ArticleRepositoryModel]

    enum CodingKeys: String, CodingKey {
        case status, copyright
        case numResults = "num_results"
        case results
    }
}

struct ArticleRepositoryModel: Codable {
    let uri: String
    let url: String
    let id, assetID: Int
    let source, publishedDate, updated, section: String
    let subsection, nytdsection, adxKeywords: String
    let byline, type, title, abstract: String
    let desFacet: [String]
    let media: [Media]
    let etaID: Int

    enum CodingKeys: String, CodingKey {
        case uri, url, id
        case assetID = "asset_id"
        case source
        case publishedDate = "published_date"
        case updated, section, subsection, nytdsection
        case adxKeywords = "adx_keywords"
        case byline, type, title, abstract
        case desFacet = "des_facet"
        case media
        case etaID = "eta_id"
    }
}

// MARK: - Media
struct Media: Codable {
    let type, subtype, caption, copyright: String
    let approvedForSyndication: Int
    let mediaMetadata: [MediaMetadatum]

    enum CodingKeys: String, CodingKey {
        case type, subtype, caption, copyright
        case approvedForSyndication = "approved_for_syndication"
        case mediaMetadata = "media-metadata"
    }
}

// MARK: - MediaMetadatum
struct MediaMetadatum: Codable {
    let url: String
    let format: String
    let height, width: Int
}
