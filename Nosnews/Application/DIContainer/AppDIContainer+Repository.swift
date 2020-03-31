//
//  AppDIContainer+Repository.swift
//  Nosnews
//
//  Created by Arif Luthfiansyah on 25/03/20.
//  Copyright © 2020 Ayo Development. All rights reserved.
//

import Foundation

extension AppDIContainer: DIRepositoryFactory {
    
    func makeArticlesRepository() -> ArticlesRepository {
        return DefaultArticlesRepository(dataTransferService: self.newsDataTransferService)
    }
    
    func makeSourcesRepository() -> SourcesRepository {
        return DefaultSourcesRepository(dataTransferService: self.newsDataTransferService)
    }
    
}
