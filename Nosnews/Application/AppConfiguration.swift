//
//  AppConfiguration.swift
//  Nosnews
//
//  Created by Arif Luthfiansyah on 25/03/20.
//  Copyright © 2020 Ayo Development. All rights reserved.
//

import Foundation

final class AppConfiguration {
    
    lazy var newsAPIBaseURL: String = {
        guard let api = Bundle.main.object(forInfoDictionaryKey: "NewsAPI") as? [String: String],
              let baseURL = api["BaseURL"] else {
            fatalError("BaseURL in NewsAPI must not be empty in plist")
        }
        return baseURL
    }()
    lazy var newsAPIKey: String = {
        guard let api = Bundle.main.object(forInfoDictionaryKey: "NewsAPI") as? [String: String],
              let key = api["APIKey"] else {
            fatalError("APIKey in NewsAPI must not be empty in plist")
        }
        return key
    }()
    
}
