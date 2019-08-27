//
//  News.swift
//  Nosnews
//
//  Created by Arif Luthfiansyah on 27/08/19.
//  Copyright © 2019 Ayo Development. All rights reserved.
//

import Foundation

// MARK: - News
struct News {
    let status: String?
    let totalResults: Int?
    let articles: [Article]
}

extension News: Codable {
    
    enum NewsCodingKey: String, CodingKey {
        case status
        case totalResults
        case articles
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: NewsCodingKey.self)
        
        self.status = try container.decode(String.self, forKey: .status)
        self.totalResults = try container.decode(Int.self, forKey: .totalResults)
        self.articles = try container.decode([Article].self, forKey: .articles)
    }
    
}
