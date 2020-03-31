//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  Copyright (c) ___YEAR___ All rights reserved.
//
//  Template:
//  Modified by Arif Luthfiansyah
//  Created by Oleh Kudinov

import Foundation

struct ___VARIABLE_sceneIdentifier___ViewModelRouteClosure {
    var pop: (() -> Void)
}

protocol ___VARIABLE_sceneIdentifier___ViewModelInput {
    func viewDidLoad()
}

protocol ___VARIABLE_sceneIdentifier___ViewModelOutput {
}

protocol ___VARIABLE_sceneIdentifier___ViewModel: ___VARIABLE_sceneIdentifier___ViewModelInput, ___VARIABLE_sceneIdentifier___ViewModelOutput { }

class Default___VARIABLE_sceneIdentifier___ViewModel: ___VARIABLE_sceneIdentifier___ViewModel {
    
    private var route: ___VARIABLE_sceneIdentifier___ViewModelRouteClosure?
    
    // MARK: - OUTPUT
    
    init(route: ___VARIABLE_sceneIdentifier___ViewModelRouteClosure) {
        self.route = route
    }
    
}

// MARK: - INPUT
extension Default___VARIABLE_sceneIdentifier___ViewModel {
    
    func viewDidLoad() {
    }
    
}

// MARK: - Private Function
extension Default___VARIABLE_sceneIdentifier___ViewModel {
    
}
