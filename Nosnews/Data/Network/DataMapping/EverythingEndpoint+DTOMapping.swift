//
//  EverythingEndpoint+DTOMapping.swift
//  Nosnews
//
//  Created by Arif Luthfiansyah on 25/03/20.
//  Copyright © 2020 Ayo Development. All rights reserved.
//

import Foundation

extension NewsAPIEndpoint {
    struct Everything {
        struct RequestDTO: Encodable {
            let domains: String?
            let fromDateString: String?
            let sortBy: String?
            let sources: String?
            let toDateString: String?
            let page: Int
            let pageSize: Int
            let q: String
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
        
        struct ArticleResponseDTO: Decodable {
            let source: ArticleSourceResponseDTO
            let author: String?
            let title: String?
            let description: String?
            let url: String?
            let urlToImage: String?
            let publishedAt: String?
            let content: String?
            
            enum CodingKeys: String, CodingKey {
                case source
                case author
                case title
                case description
                case url
                case urlToImage
                case publishedAt
                case content
            }
        }

        struct ArticleSourceResponseDTO: Decodable {
            let id: String?
            let name: String
            
            enum CodingKeys: String, CodingKey {
                case id
                case name
            }
        }
    }
}

extension NewsAPIEndpoint.Everything.ArticlePageResponseDTO {
    
    func entity() -> ArticlePage {
        return ArticlePage(status: self.status, totalResults: self.totalResults, articles: self.articles.map { $0.entity() } )
    }
    
}

extension NewsAPIEndpoint.Everything.ArticleResponseDTO {
    
    func entity() -> Article {
        return .init(source: self.source.entity(), author: self.author ?? "", title: self.title ?? "", description: self.description ?? "", url: self.url ?? "", urlToImage: self.urlToImage ?? "", publishedAt: self.publishedAt?.publishedAtDateString() ?? "", content: self.content ?? "")
    }
    
}

extension NewsAPIEndpoint.Everything.ArticleSourceResponseDTO {
    
    func entity() -> ArticleSource {
        return .init(id: self.id ?? "", name: self.name)
    }
    
}

extension String {
    
    fileprivate func publishedAtDateString() -> String {
        let receivedDateFormatter = DateFormatter()
        receivedDateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss'Z'"
        
        if let receivedDate = receivedDateFormatter.date(from: self) {
            return receivedDate.ddMMMyyyy(separator: " ")
        }
        
        return ""
    }
    
}
