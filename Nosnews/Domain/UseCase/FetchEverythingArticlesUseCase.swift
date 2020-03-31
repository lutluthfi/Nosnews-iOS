//
//  FetchEverythingArticlesUseCase.swift
//  Nosnews
//
//  Created by Arif Luthfiansyah on 29/03/20.
//  Copyright © 2020 Ayo Development. All rights reserved.
//

import Foundation

struct FetchEverythingArticlesUseCaseRequestValue {
    let domains: String?
    let fromDateString: String?
    let sortBy: String?
    let sources: String?
    let toDateString: String?
    let page: Int
    let pageSize: Int
    let query: String
}

protocol FetchEverythingArticlesUseCase {
    func execute(requestValue: FetchEverythingArticlesUseCaseRequestValue, completion: @escaping (Result<[Article], Error>) -> Void) -> Cancellable?
}

final class DefaultFetchEverythingArticlesUseCase: FetchEverythingArticlesUseCase {
    
    private let articlesRepository: ArticlesRepository
    
    init(articlesRepository: ArticlesRepository) {
        self.articlesRepository = articlesRepository
    }
    
    func execute(requestValue: FetchEverythingArticlesUseCaseRequestValue, completion: @escaping (Result<[Article], Error>) -> Void) -> Cancellable? {
        self.articlesRepository.everythingArticles(domains: requestValue.domains, fromDateString: requestValue.fromDateString, sortBy: requestValue.sortBy, sources: requestValue.sources, toDateString: requestValue.toDateString, page: requestValue.page, pageSize: requestValue.pageSize, query: requestValue.query) { (result) in
            switch result {
            case .success(let response):
                completion(.success(response.articles))
                break
            case .failure(let error):
                completion(.failure(error))
                break
            }
        }
    }
    
}
