//
//  SourcesDataService.swift
//  Nosnews
//
//  Created by Arif Luthfiansyah on 01/09/19.
//  Copyright © 2019 Ayo Development. All rights reserved.
//

import Foundation
import Moya

class SourcesDataService {
    
    fileprivate let provider = MoyaProvider<SourcesService>(endpointClosure: { (target) -> Endpoint in
        let defaultEndpoint = MoyaProvider.defaultEndpointMapping(for: target)
        switch target {
        default:
            let httpHeaderFields = ["Content-Type": "application/json"]
            return defaultEndpoint.adding(newHTTPHeaderFields: httpHeaderFields)
        }
    }, plugins: [NetworkLoggerPlugin(verbose: true)])
    
    func all(apiKey: String, completion: @escaping((Sources?, Error?) -> Void)) {
        provider.request(.all(apiKey: apiKey)) { result in
            switch result {
            case .success(let response):
                do {
                    let decoder = JSONDecoder()
                    let foo = try decoder.decode(Sources.self, from: response.data)
                    completion(foo, nil)
                } catch (let error) {
                    completion(nil, error)
                }
            case .failure(let error):
                completion(nil, error)
            }
        }
    }
    
//    func headlines(country: String, category: String, apiKey: String, completion: @escaping ((News?, Error?) -> Void)) {
//        provider.request(.headlines(country: country, category: category, apiKey: apiKey)) { (result) in
//            switch result {
//            case .success(let response):
//                do {
//                    let decoder = JSONDecoder()
//                    let news = try decoder.decode(News.self, from: response.data)
//                    completion(news, nil)
//                } catch (let error) {
//                    completion(nil, error)
//                }
//            case .failure(let error):
//                completion(nil, error)
//            }
//        }
//    }
    
}
