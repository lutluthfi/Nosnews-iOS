//
//  Article+DTOMapping.swift
//  Nosnews
//
//  Created by Arif Luthfiansyah on 25/03/20.
//  Copyright © 2020 Ayo Development. All rights reserved.
//

import Foundation

struct ArticleRequestDTO: Encodable {
    let category: String
    let country: String
    let query: String
}

struct ArticlePageResponseDTO: Decodable {
    let status: String
    let totalResults: Int
    let articles: [ArticleResponseDTO]
    
    enum CodingKeys: String, CodingKey {
        case status
        case totalResults
        case articles
    }
}

extension ArticlePageResponseDTO {
    struct ArticleResponseDTO: Decodable {
        let author: String
        let title: String
        let description: String
        let url: String
        let urlToImage: String
        let publishedAt: String
        let content: String
        
        enum CodingKeys: String, CodingKey {
            case author
            case title
            case description
            case url
            case urlToImage
            case publishedAt
            case content
        }
    }
}

extension ArticlePageResponseDTO {
    
    func entity() -> ArticlePage {
        return ArticlePage(status: self.status, totalResults: self.totalResults, articles: self.articles.map { $0.entity() } )
    }
    
}

extension ArticlePageResponseDTO.ArticleResponseDTO {
    
    func entity() -> Article {
        return Article(author: self.author, title: self.title, description: self.description, url: self.url, urlToImage: self.urlToImage, publishedAt: self.publishedAt, content: self.content)
    }
    
}
