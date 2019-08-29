//
//  News.swift
//  Nosnews
//
//  Created by Arif Luthfiansyah on 27/08/19.
//  Copyright © 2019 Ayo Development. All rights reserved.
//

import Foundation

// MARK: - News
struct News: Codable {
    let status: String?
    let code: String?
    let message: String?
    let totalResults: Int?
    let articles: [Article]
    
    enum NewsCodingKey: String, CodingKey {
        case status = "status"
        case code = "code"
        case message = "message"
        case totalResults = "totalResults"
        case articles = "articles"
    }
    
}

//extension News {
//    
//    init(from decoder: Decoder) throws {
//        let container = try decoder.container(keyedBy: NewsCodingKey.self)
//        
//        self.status = try container.decode(String.self, forKey: .status)
//        self.code = try container.decode(String.self, forKey: .code)
//        self.message = try container.decode(String.self, forKey: .message)
//        self.totalResults = try container.decode(Int.self, forKey: .totalResults)
//        self.articles = try container.decode([Article].self, forKey: .articles)
//    }
//    
//}
