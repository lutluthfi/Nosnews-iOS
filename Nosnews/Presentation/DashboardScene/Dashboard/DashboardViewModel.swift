//
//  DashboardViewModel.swift
//  Nosnews
//
//  Created by Arif Luthfiansyah on 25/03/20.
//  Copyright (c) 2020 All rights reserved.
//

import Foundation

struct DashboardViewModelRouteClosure {
    var pop: (() -> Void)
}

protocol DashboardViewModelInput {
    func viewDidLoad()
}

protocol DashboardViewModelOutput {
}

protocol DashboardViewModel: DashboardViewModelInput, DashboardViewModelOutput { }

class DefaultDashboardViewModel: DashboardViewModel {
    
    private var route: DashboardViewModelRouteClosure?
    
    // MARK: - OUTPUT
    
    init(route: DashboardViewModelRouteClosure) {
        self.route = route
    }
    
}

// MARK: - INPUT. View event methods
extension DefaultDashboardViewModel {
    
    func viewDidLoad() {
    }
    
}
