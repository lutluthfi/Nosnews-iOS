//
//  Source.swift
//  Nosnews
//
//  Created by Arif Luthfiansyah on 28/03/20.
//  Copyright © 2020 Ayo Development. All rights reserved.
//

import Foundation

struct Source: Hashable {
    let id: String
    let name: String
    let description: String
    let url: String
    let category: String
    let language: String
    let country: String
    
    public static func == (lhs: Source, rhs: Source) -> Bool {
        return lhs.id == rhs.id
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(self.id)
    }
    
}
