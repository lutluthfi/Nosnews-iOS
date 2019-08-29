//
//  Article.swift
//  Nosnews
//
//  Created by Arif Luthfiansyah on 27/08/19.
//  Copyright © 2019 Ayo Development. All rights reserved.
//

import Foundation

// MARK: - Article
struct Article: Codable {
    let source: ArticleSource?
    let author: String?
    let title: String?
    let description: String?
    let url: String?
    let urlToImage: String?
    let publishedAt: String?
    let content: String?
    
    enum ArticleCodingKey: String, CodingKey {
        case source = "source"
        case author = "author"
        case title = "title"
        case description = "description"
        case url = "url"
        case urlToImage = "urlToImage"
        case publishedAt = "publishedAt"
        case content = "content"
    }
    
}

//extension Article {
//    
//    
//    
//    init(from decoder: Decoder) throws {
//        let container = try decoder.container(keyedBy: ArticleCodingKey.self)
//        
//        self.source = try container.decode(ArticleSource.self, forKey: .source)
//        self.author = try container.decode(String.self, forKey: .author)
//        self.title = try container.decode(String.self, forKey: .title)
//        self.description = try container.decode(String.self, forKey: .description)
//        self.url = try container.decode(String.self, forKey: .url)
//        self.urlToImage = try container.decode(String.self, forKey: .urlToImage)
//        self.publishedAt = try container.decode(String.self, forKey: .publishedAt)
//        self.content = try container.decode(String.self, forKey: .content)
//    }
//    
//}
