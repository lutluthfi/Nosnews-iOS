//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  Copyright (c) ___YEAR___ All rights reserved.
//

import Foundation

final class ___VARIABLE_entityIdentifier___UserDefaultsStorage {
    
    private let maxStorageLimit: Int
    private var userDefaults: UserDefaults { return UserDefaults.standard }
    
    init(maxStorageLimit: Int) {
        self.maxStorageLimit = maxStorageLimit
    }

    private func fetch() -> [Any] {
        return []
    }

    private func persist(___VARIABLE_entityIdentifier___s: [Any]) {
        let encoder = JSONEncoder()
    }

    private func remove(_ ___VARIABLE_entityIdentifier___s: [Any]) -> [Any] {
        return []
    }
}
