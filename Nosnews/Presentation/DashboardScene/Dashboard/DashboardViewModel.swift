//
//  DashboardViewModel.swift
//  Nosnews
//
//  Created by Arif Luthfiansyah on 25/03/20.
//  Copyright (c) 2020 All rights reserved.
//

import Foundation

struct DashboardViewModelRoute {
    var pop: (() -> Void)
}

protocol DashboardViewModelInput {
    func routing(with route: DashboardViewModelRoute?)
    func viewDidLoad()
}

protocol DashboardViewModelOutput {
}

protocol DashboardViewModel: DashboardViewModelInput, DashboardViewModelOutput { }

class DefaultDashboardViewModel: DashboardViewModel {
    
    private var route: DashboardViewModelRoute?
    
    // MARK: - OUTPUT
    
    init() {
    }
    
}

// MARK: - INPUT. View event methods
extension DefaultDashboardViewModel {
    
    func routing(with route: DashboardViewModelRoute?) {
        self.route = route
    }
    
    func viewDidLoad() {
    }
    
}
