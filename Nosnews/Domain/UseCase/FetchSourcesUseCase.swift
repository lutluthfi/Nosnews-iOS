//
//  FetchSourcesUseCase.swift
//  Nosnews
//
//  Created by Arif Luthfiansyah on 28/03/20.
//  Copyright © 2020 Ayo Development. All rights reserved.
//

import Foundation

struct FetchSourcesUseCaseRequestValue {
    let category: String?
    let country: String?
}

protocol FetchSourcesUseCase {
    func execute(requestValue: FetchSourcesUseCaseRequestValue, completion: @escaping (Result<SourcePage, Error>) -> Void) -> Cancellable?
}

final class DefaultFetchSourcesUseCase: FetchSourcesUseCase {
    
    private let sourcesRepository: SourcesRepository
    
    init(sourcesRepository: SourcesRepository) {
        self.sourcesRepository = sourcesRepository
    }
    
    func execute(requestValue: FetchSourcesUseCaseRequestValue, completion: @escaping (Result<SourcePage, Error>) -> Void) -> Cancellable? {
        return self.sourcesRepository.sources(category: requestValue.category, country: requestValue.country) { (result) in
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
