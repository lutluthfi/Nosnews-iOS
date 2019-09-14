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
