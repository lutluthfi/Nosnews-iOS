//
//  Source.swift
//  Nosnews
//
//  Created by Arif Luthfiansyah on 31/08/19.
//  Copyright © 2019 Ayo Development. All rights reserved.
//

import Foundation

struct Sources: Codable {
    
    let id: String?
    let sources: [Source]
    
    enum SourcesCodingKey: String, CodingKey {
        case id = "id"
        case sources = "sources"
    }
}
