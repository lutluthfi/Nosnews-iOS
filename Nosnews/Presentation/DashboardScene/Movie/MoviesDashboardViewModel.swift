//
//  MoviesDashboardViewModel.swift
//  Nosnews
//
//  Created by Arif Luthfiansyah on 25/03/20.
//  Copyright (c) 2020 All rights reserved.
//

import Foundation

struct MoviesDashboardViewModelRouteClosure {
    var pop: (() -> Void)
}

protocol MoviesDashboardViewModelInput {
    func viewDidLoad()
}

protocol MoviesDashboardViewModelOutput {
}

protocol MoviesDashboardViewModel: MoviesDashboardViewModelInput, MoviesDashboardViewModelOutput { }

class DefaultMoviesDashboardViewModel: MoviesDashboardViewModel {
    
    private var route: MoviesDashboardViewModelRouteClosure?
    
    // MARK: - OUTPUT
    
    init(route: MoviesDashboardViewModelRouteClosure) {
        self.route = route
    }
    
}

// MARK: - INPUT. View event methods
extension DefaultMoviesDashboardViewModel {
    
    func viewDidLoad() {
    }
    
}
