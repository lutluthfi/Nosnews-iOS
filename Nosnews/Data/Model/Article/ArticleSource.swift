//
//  ArticleSource.swift
//  Nosnews
//
//  Created by Arif Luthfiansyah on 27/08/19.
//  Copyright © 2019 Ayo Development. All rights reserved.
//

import Foundation

// MARK: - Article Source
struct ArticleSource: Codable {
    let id: String?
    let name: String?
    
    enum ArticleSourceCodingKey: String, CodingKey {
        case id = "id"
        case name = "name"
    }
    
}

//extension ArticleSource {
//    
//    
//    
//    init(from decoder: Decoder) throws {
//        let container = try decoder.container(keyedBy: ArticleSourceCodingKey.self)
//        
//        self.id = try container.decode(String.self, forKey: .id)
//        self.name = try container.decode(String.self, forKey: .name)
//    }
//    
//}