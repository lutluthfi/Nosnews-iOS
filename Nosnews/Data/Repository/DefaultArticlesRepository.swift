//
//  DefaultArticlesRepository.swift
//  Nosnews
//
//  Created by Arif Luthfiansyah on 25/03/20.
//  Copyright © 2020 Ayo Development. All rights reserved.
//

import Foundation

final class DefaultArticlesRepository {
    
    private let dataTransferService: DataTransferService
    
    init(dataTransferService: DataTransferService) {
        self.dataTransferService = dataTransferService
    }
    
}

extension DefaultArticlesRepository: ArticlesRepository {
    
    func everythingArticles(domains: String?, fromDateString: String?, sortBy: String?, sources: String?, toDateString: String?, page: Int, pageSize: Int, query: String, completion: @escaping (Result<ArticlePage, Error>) -> Void) -> Cancellable? {
        let requestDTO = NewsAPIEndpoint.Everything.RequestDTO(domains: domains, fromDateString: fromDateString, sortBy: sortBy, sources: sources, toDateString: toDateString, page: page, pageSize: pageSize, q: query)
        let endpoint = NewsAPIEndpoint.everythingArticles(with: requestDTO)
        
        let request = self.dataTransferService.request(with: endpoint) { (result) in
            switch result {
            case .success(let response):
                completion(.success(response.entity()))
                break
            case .failure(let error):
                completion(.failure(error))
                break
            }
        }
        
        return NetworkTask(request: request)
    }
    
    
    func topHeadlineArticles(category: String?, country: String, sources: String?, query: String?, page: String, pageSize: String, completion: @escaping (Result<ArticlePage, Error>) -> Void) -> Cancellable? {
        let requestDTO = NewsAPIEndpoint.TopHeadline.RequestDTO(category: category, country: country, sources: sources, q: query, page: page, pageSize: pageSize)
        let endpoint = NewsAPIEndpoint.topHeadlineArticles(with: requestDTO)
        
        let request = self.dataTransferService.request(with: endpoint) { (result) in
            switch result {
            case .success(let response):
                completion(.success(response.entity()))
                break
            case .failure(let error):
                completion(.failure(error))
                break
            }
        }
        
        return NetworkTask(request: request)
    }
    
}
