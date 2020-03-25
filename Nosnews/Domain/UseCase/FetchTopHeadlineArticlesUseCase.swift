//
//  FetchTopHeadlineArticlesUseCase.swift
//  Nosnews
//
//  Created by Arif Luthfiansyah on 25/03/20.
//  Copyright © 2020 Ayo Development. All rights reserved.
//

import Foundation

struct FetchTopHeadlineArticlesRequestValue {
    let category: String?
    let country: String
    let sources: String?
    let query: String?
}

protocol FetchTopHeadlineArticlesUseCase {
    func execute(requestValue: FetchTopHeadlineArticlesRequestValue, completion: @escaping (Result<ArticlePage, Error>) -> Void)
}

final class DefaultFetchTopHeadlinArticlesUseCase: FetchTopHeadlineArticlesUseCase {
    
    private let articlesRepository: ArticlesRepository
    
    init(articlesRepository: ArticlesRepository) {
        self.articlesRepository = articlesRepository
    }
    
    func execute(requestValue: FetchTopHeadlineArticlesRequestValue, completion: @escaping (Result<ArticlePage, Error>) -> Void) {
        self.articlesRepository.topHeadlineArticles(category: requestValue.category, country: requestValue.country, sources: requestValue.sources, query: requestValue.query) { [weak self] (result) in
            switch result {
            case .success(let response):
                completion(.success(response))
                break
            case .failure(let error):
                completion(.failure(error))
                break
            }
        }
    }
    
}
