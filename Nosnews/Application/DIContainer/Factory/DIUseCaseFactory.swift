//
//  DIUseCaseFactory.swift
//  Nosnews
//
//  Created by Arif Luthfiansyah on 25/03/20.
//  Copyright © 2020 Ayo Development. All rights reserved.
//

import Foundation

protocol DIUseCaseRepository {
    func makeFetchTopHeadlineArticlesUseCase() -> FetchTopHeadlineArticlesUseCase
}
