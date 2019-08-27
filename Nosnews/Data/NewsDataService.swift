//
//  NewsDataService.swift
//  Nosnews
//
//  Created by Arif Luthfiansyah on 27/08/19.
//  Copyright © 2019 Ayo Development. All rights reserved.
//

import Foundation
import Moya

class NewsDataService {
    
    fileprivate let provider = MoyaProvider<NewsService>(endpointClosure: { (target: NewsService) -> Endpoint in
        let defaultEndpoint = MoyaProvider.defaultEndpointMapping(for: target)
        switch target {
        default:
            let httpHeaderFields = ["Content-Type": "application/json"]
            return defaultEndpoint.adding(newHTTPHeaderFields: httpHeaderFields)
        }
    })
    
    func headlines(country: String, category: String, apiKey: String, completion: @escaping ((News?, Error?) -> Void)) {
        provider.request(.headlines(country: country, category: category, apiKey: apiKey)) { (result) in
            switch result {
            case .success(let response):
                do {
                    let decoder = JSONDecoder()
                    let news = try decoder.decode(News.self, from: response.data)
                    completion(news, nil)
                } catch (let error) {
                    completion(nil, error)
                }
            case .failure(let error):
                completion(nil, error)
            }
        }
    }
    
}
