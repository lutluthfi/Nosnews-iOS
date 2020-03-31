//
//  DefaultSourcesRepository.swift
//  Nosnews
//
//  Created by Arif Luthfiansyah on 28/03/20.
//  Copyright © 2020 Ayo Development. All rights reserved.
//

import Foundation

final class DefaultSourcesRepository {
    
    private let dataTransferService: DataTransferService
    
    init(dataTransferService: DataTransferService) {
        self.dataTransferService = dataTransferService
    }
    
}

extension DefaultSourcesRepository: SourcesRepository {
    
    func sources(category: String?, country: String?, completion: @escaping (Result<SourcePage, Error>) -> Void) -> Cancellable? {
        let requestDTO = NewsAPIEndpoint.Sources.RequestDTO(category: category, country: country)
        let endpoint = NewsAPIEndpoint.sources(with: requestDTO)
        
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
