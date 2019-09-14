//
//  NewsApi.swift
//  Nosnews
//
//  Created by Arif Luthfiansyah on 27/08/19.
//  Copyright © 2019 Ayo Development. All rights reserved.
//

import Foundation
import Moya

enum NewsService {
    
    /// Used for https://newsapi.org/v2/top-headlines
    case headlines(country: String, category: String, apiKey: String)
    
}

extension NewsService: TargetType {
    
    var baseURL: URL {
        let baseUrl = R.String.baseUrl
        guard let url = URL(string: baseUrl) else {
            fatalError("URL cannot be configured.")
        }
        return url
    }
    
    var path: String {
        switch self {
        case .headlines(country: _, category: _, apiKey: _):
            return "top-headlines"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .headlines(country: _, category: _, apiKey: _):
            return .get
        }
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        switch self {
        case .headlines(let country, let category, let apiKey):
            var params: [String: Any] = [:]
            
            params["country"] = country
            params["category"] = category
            params["apiKey"] = apiKey
            
            return .requestParameters(parameters: params, encoding: URLEncoding.default)
        }
    }
    
    var headers: [String : String]? {
        return nil
    }
    
}
