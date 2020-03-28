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
    var displayedArticles: Observable<[Article]> { get }
}

protocol SearchDashboardViewModel: SearchDashboardViewModelInput, SearchDashboardViewModelOutput { }

class DefaultSearchDashboardViewModel: SearchDashboardViewModel {
    
    private let fetchTopHeadlineArticlesUseCase: FetchTopHeadlineArticlesUseCase
    
    private var route: SearchDashboardViewModelRouteClosure?
    
    // MARK: - OUTPUT
    let displayedArticles: Observable<[Article]> = .init([])
    
    init(route: SearchDashboardViewModelRouteClosure, fetchTopHeadlineArticlesUseCase: FetchTopHeadlineArticlesUseCase) {
        self.route = route
        self.fetchTopHeadlineArticlesUseCase = fetchTopHeadlineArticlesUseCase
    }
    
}

// MARK: - INPUT
extension DefaultSearchDashboardViewModel {
    
    func viewDidLoad() {
        self.doFetchTopHeadlingArticles()
    }
    
}

// MARK: - Private Function
extension DefaultSearchDashboardViewModel {
    
    private func doFetchTopHeadlingArticles(category: String? = nil, country: String = "id", sources: String? = nil, query: String? = nil) {
        let requestValue = FetchTopHeadlineArticlesRequestValue(category: category, country: country, sources: sources, query: query)
        self.fetchTopHeadlineArticlesUseCase.execute(requestValue: requestValue) { [weak self] (result) in
            guard let unwrappedSelf = self else { return }
            switch result {
            case .success(let response):
                unwrappedSelf.displayedArticles.value = response.articles
                break
            case .failure(_):
                break
            }
        }
    }
    
}
