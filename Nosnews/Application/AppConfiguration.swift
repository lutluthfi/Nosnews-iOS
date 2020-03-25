//
//  AppConfiguration.swift
//  Nosnews
//
//  Created by Arif Luthfiansyah on 25/03/20.
//  Copyright © 2020 Ayo Development. All rights reserved.
//

import Foundation

final class AppConfiguration {
    
    lazy var NewsAPIKey: String = {
        guard let key = Bundle.main.object(forInfoDictionaryKey: "NewsAPIKey") as? String else {
            fatalError("NewsAPIKey must not be empty in plist")
        }
        return key
    }()
    lazy var NewsAPIBaseURL: String = {
        guard let baseURL = Bundle.main.object(forInfoDictionaryKey: "NewsAPIBaseURL") as? String else {
            fatalError("NewsAPIBaseURL must not be empty in plist")
        }
        return baseURL
    }()
    
}
