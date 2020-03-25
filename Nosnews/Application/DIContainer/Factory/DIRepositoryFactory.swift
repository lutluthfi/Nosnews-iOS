//
//  DIRepositoryFactory.swift
//  Nosnews
//
//  Created by Arif Luthfiansyah on 25/03/20.
//  Copyright © 2020 Ayo Development. All rights reserved.
//

import Foundation

protocol DIRepositoryFactory {
    func makeArticlesRepository() -> ArticlesRepository
}
