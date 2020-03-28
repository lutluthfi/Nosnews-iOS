//
//  AppDIContainer+UseCase.swift
//  Nosnews
//
//  Created by Arif Luthfiansyah on 25/03/20.
//  Copyright © 2020 Ayo Development. All rights reserved.
//

import Foundation

extension AppDIContainer: DIUseCaseRepository {
    func makeFetchTopHeadlineArticlesUseCase() -> FetchTopHeadlineArticlesUseCase {
        return DefaultFetchTopHeadlinArticlesUseCase(articlesRepository: self.makeArticlesRepository())
    }
    
    func makeFetchSourcesUseCase() -> FetchSourcesUseCase {
        return DefaultFetchSourcesUseCase(sourcesRepository: self.makeSourcesRepository())
    }
}
