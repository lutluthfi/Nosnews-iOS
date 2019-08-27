//
//  ArticleSource.swift
//  Nosnews
//
//  Created by Arif Luthfiansyah on 27/08/19.
//  Copyright © 2019 Ayo Development. All rights reserved.
//

import Foundation

// MARK: - Article Source
struct ArticleSource {
    let id: String?
    let name: String?
}

extension ArticleSource: Codable {
    
    enum ArticleSourceCodingKey: String, CodingKey {
        case id
        case name
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: ArticleSourceCodingKey.self)
        
        self.id = try container.decode(String.self, forKey: .id)
        self.name = try container.decode(String.self, forKey: .name)
    }
    
}
