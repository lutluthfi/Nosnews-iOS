//
//  SourcesService.swift
//  Nosnews
//
//  Created by Arif Luthfiansyah on 31/08/19.
//  Copyright © 2019 Ayo Development. All rights reserved.
//

import Foundation
import Moya

enum SourcesService {
    
    /// Used for  https://newsapi.org/v2/sources
    case all(apiKey: String)
    case language(language: String, apiKey: String)
    case languageCountry(language: String, country: String, apiKey: String)
    
}

extension SourcesService: TargetType {
    
    var baseURL: URL {
        let baseUrl = R.String.baseUrl
        guard let url = URL(string: baseUrl) else {
            fatalError("URL cannot be configured.")
        }
        return url
    }
    
    var path: String {
        switch self {
        case .all(_),
             .language(_, _),
             .languageCountry(language: _, country: _, apiKey: _):
            return "sources"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .all(apiKey: _),
             .language(language: _, apiKey: _),
             .languageCountry(language: _, country: _, apiKey: _):
            return .get
        }
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        switch self {
        case .all(let apiKey):
            var params: [String: Any] = [:]
            
            params["apiKey"] = apiKey
            
            return .requestParameters(parameters: params, encoding: URLEncoding.default)
        case .language(let language, let apiKey):
            var params: [String: Any] = [:]
            
            params["language"] = language
            params["apiKey"] = apiKey
            
            return .requestParameters(parameters: params, encoding: URLEncoding.default)
        case .languageCountry(let language, let country , let apiKey):
            var params: [String: Any] = [:]
            
            params["language"] = language
            params["country"] = country
            params["apiKey"] = apiKey
            
            return .requestParameters(parameters: params, encoding: URLEncoding.default)
        }
    }
    
    var headers: [String : String]? {
        return nil
    }
    
}
