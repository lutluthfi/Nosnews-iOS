//
//  SearchDashboardViewModel.swift
//  Nosnews
//
//  Created by Arif Luthfiansyah on 25/03/20.
//  Copyright (c) 2020 All rights reserved.
//

import Foundation

struct SearchDashboardViewModelRouteClosure {
    var pop: (() -> Void)
}

protocol SearchDashboardViewModelInput {
    func viewDidLoad()
}

protocol SearchDashboardViewModelOutput {
}

protocol SearchDashboardViewModel: SearchDashboardViewModelInput, SearchDashboardViewModelOutput { }

class DefaultSearchDashboardViewModel: SearchDashboardViewModel {
    
    private var route: SearchDashboardViewModelRouteClosure?
    
    // MARK: - OUTPUT
    
    init(route: SearchDashboardViewModelRouteClosure) {
        self.route = route
    }
    
}

// MARK: - INPUT. View event methods
extension DefaultSearchDashboardViewModel {
    
    func viewDidLoad() {
    }
    
}
