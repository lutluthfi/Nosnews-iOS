//
//  Source.swift
//  Nosnews
//
//  Created by Arif Luthfiansyah on 31/08/19.
//  Copyright © 2019 Ayo Development. All rights reserved.
//

import Foundation

struct Source: Codable {
    
    let id: String?
    let name: String?
    let description: String?
    let url: String?
    let category: String?
    let language: String?
    let country: String?
    
    enum SourceCodingKey: String, CodingKey {
        case id = "id"
        case name = "name"
        case description = "description"
        case url = "url"
        case category = "category"
        case language = "language"
        case country = "country"
    }
    
}
