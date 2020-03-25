//
//  NewsDashboardViewModel.swift
//  Nosnews
//
//  Created by Arif Luthfiansyah on 25/03/20.
//  Copyright (c) 2020 All rights reserved.
//

import Foundation

struct NewsDashboardViewModelRouteClosure {
    var pop: (() -> Void)
}

protocol NewsDashboardViewModelInput {
    func viewDidLoad()
}

protocol NewsDashboardViewModelOutput {
}

protocol NewsDashboardViewModel: NewsDashboardViewModelInput, NewsDashboardViewModelOutput { }

class DefaultNewsDashboardViewModel: NewsDashboardViewModel {
    
    private let fetchTopHeadlineArticlesUseCase: FetchTopHeadlineArticlesUseCase
    
    private var route: NewsDashboardViewModelRouteClosure?
    
    // MARK: - OUTPUT
    
    init(route: NewsDashboardViewModelRouteClosure, fetchTopHeadlineArticlesUseCase: FetchTopHeadlineArticlesUseCase) {
        self.route = route
        self.fetchTopHeadlineArticlesUseCase = fetchTopHeadlineArticlesUseCase
    }
    
}

// MARK: - INPUT. View event methods
extension DefaultNewsDashboardViewModel {
    
    func viewDidLoad() {
    }
    
}
