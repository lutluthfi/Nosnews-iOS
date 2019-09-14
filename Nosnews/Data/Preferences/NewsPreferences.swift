//
//  NewsPreferences.swift
//  Nosnews
//
//  Created by Arif Luthfiansyah on 29/08/19.
//  Copyright © 2019 Ayo Development. All rights reserved.
//

import Foundation

enum NewsPreferencesKey: String {
    case categoryKey = "categoryKey"
    case countryKey = "countryKey"
}

class NewsPreferences {
    
    // MARK: - Static Variable
    static let sInstances = NewsPreferences()
    private var mPreferences: UserDefaults
    
    private init() {
        self.mPreferences = UserDefaults.standard
    }
    
    // MARK: - Getter Function
    func value<T>(defaultValue: T, forKey key: NewsPreferencesKey) -> T {
        return self.mPreferences.object(forKey: key.rawValue) == nil ?
            defaultValue : self.mPreferences.object(forKey: key.rawValue) as! T
    }
    
    // MARK: - Setter Function
    func value(value: Any, forKey key: NewsPreferencesKey) {
        self.mPreferences.set(value, forKey: key.rawValue)
    }
}
