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
    let page: String
    let pageSize: String
}

protocol FetchTopHeadlineArticlesUseCase {
    func execute(requestValue: FetchTopHeadlineArticlesRequestValue, completion: @escaping (Result<ArticlePage, Error>) -> Void) -> Cancellable?
}

final class DefaultFetchTopHeadlinArticlesUseCase: FetchTopHeadlineArticlesUseCase {
    
    private let articlesRepository: ArticlesRepository
    
    init(articlesRepository: ArticlesRepository) {
        self.articlesRepository = articlesRepository
    }
    
    func execute(requestValue: FetchTopHeadlineArticlesRequestValue, completion: @escaping (Result<ArticlePage, Error>) -> Void) -> Cancellable? {
        return self.articlesRepository.topHeadlineArticles(category: requestValue.category, country: requestValue.country, sources: requestValue.sources, query: requestValue.query, page: requestValue.page, pageSize: requestValue.pageSize) { (result) in
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
