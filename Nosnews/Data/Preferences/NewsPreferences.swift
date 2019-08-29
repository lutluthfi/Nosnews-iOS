//
//  NewsPreferences.swift
//  Nosnews
//
//  Created by Arif Luthfiansyah on 29/08/19.
//  Copyright © 2019 Ayo Development. All rights reserved.
//

import Foundation

class NewsPreferences {
    
    // MARK: - Getter Function
    static func value<T>(defaultValue: T, forKey key: String) -> T {
        let preferences = UserDefaults.standard
        return preferences.object(forKey: key) == nil ? defaultValue : preferences.object(forKey: key) as! T
    }
    
    // MARK: - Setter Function
    static func value(value: Any, forKey key: String) {
        UserDefaults.standard.set(value, forKey: key)
    }
    
    static let KeyCategory = "NewsCategory"
    static let KeyCountry = "NewsCountry"
    
}
