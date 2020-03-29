//
//  TopHeadlineEndpoint+DTOMapping.swift
//  Nosnews
//
//  Created by Arif Luthfiansyah on 29/03/20.
//  Copyright © 2020 Ayo Development. All rights reserved.
//

import Foundation

extension NewsAPIEndpoint {
    struct TopHeadline {
        struct RequestDTO: Encodable {
            let category: String?
            let country: String
            let sources: String?
            let query: String?
            let page: String
            let pageSize: String
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

extension NewsAPIEndpoint.TopHeadline.ArticlePageResponseDTO {
    
    func entity() -> ArticlePage {
        return ArticlePage(status: self.status, totalResults: self.totalResults, articles: self.articles.map { $0.entity() } )
    }
    
}

extension NewsAPIEndpoint.TopHeadline.ArticleResponseDTO {
    
    func entity() -> Article {
        return .init(source: self.source.entity(), author: self.author ?? "", title: self.title ?? "", description: self.description ?? "", url: self.url ?? "", urlToImage: self.urlToImage ?? "", publishedAt: self.publishedAt?.publishedAtDateString() ?? "", content: self.content ?? "")
    }
    
}

extension NewsAPIEndpoint.TopHeadline.ArticleSourceResponseDTO {
    
    func entity() -> ArticleSource {
        return .init(id: self.id ?? "", name: self.name)
    }
    
}

extension String {
    
    fileprivate func publishedAtDateString() -> String {
        let receivedDateFormatter = DateFormatter()
        receivedDateFormatter.dateFormat = "yyyy-MM-dd'T'hh:mm:ss'Z'"
        
        if let receivedDate = receivedDateFormatter.date(from: self) {
            return receivedDate.ddMMMyyyy(separator: "-")
        }
        
        return ""
    }
    
}
