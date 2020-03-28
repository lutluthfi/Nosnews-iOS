//
//  Source+DTOMapping.swift
//  Nosnews
//
//  Created by Arif Luthfiansyah on 28/03/20.
//  Copyright © 2020 Ayo Development. All rights reserved.
//

import Foundation

struct SourceRequestDTO: Encodable {
    let language: String
    let country: String?
}

struct SourcePageResponseDTO: Decodable {
    let status: String
    let sources: [SourceResponseDTO]
    
    enum CodingKeys: String, CodingKey {
        case status
        case sources
    }
}

extension SourcePageResponseDTO {
    struct SourceResponseDTO: Decodable {
        let id: String?
        let name: String
        let description: String
        let url: String
        let category: String
        let language: String
        let country: String
        
        enum CodingKeys: String, CodingKey {
            case id
            case name
            case description
            case url
            case category
            case language
            case country
        }
    }
}

extension SourcePageResponseDTO {
    
    func entity() -> SourcePage {
        return .init(status: self.status, sources: self.sources.map { $0.entity() })
    }
    
}

extension SourcePageResponseDTO.SourceResponseDTO {
    
    func entity() -> Source {
        return .init(id: self.id ?? "", name: self.name, description: self.description, url: self.url, category: self.category, language: self.language, country: self.country)
    }
    
}
