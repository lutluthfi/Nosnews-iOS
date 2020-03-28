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
    
    func doSearch()
}

protocol SearchDashboardViewModelOutput {
    var displayedArticles: Observable<[Article]> { get }
}

protocol SearchDashboardViewModel: SearchDashboardViewModelInput, SearchDashboardViewModelOutput { }

class DefaultSearchDashboardViewModel: SearchDashboardViewModel {
    
    private let fetchSourcesUseCase: FetchSourcesUseCase
    private let fetchTopHeadlineArticlesUseCase: FetchTopHeadlineArticlesUseCase
    
    private var fetchSourcesUseCaseTask: Cancellable?
    private var fetchTopHeadlineArticlesUseCaseTask: Cancellable?
    
    private var route: SearchDashboardViewModelRouteClosure?
    
    // MARK: - OUTPUT
    let displayedArticles: Observable<[Article]> = .init([])
    
    init(route: SearchDashboardViewModelRouteClosure, fetchTopHeadlineArticlesUseCase: FetchTopHeadlineArticlesUseCase, fetchSourcesUseCase: FetchSourcesUseCase) {
        self.route = route
        self.fetchTopHeadlineArticlesUseCase = fetchTopHeadlineArticlesUseCase
        self.fetchSourcesUseCase = fetchSourcesUseCase
    }
    
}

// MARK: - INPUT
extension DefaultSearchDashboardViewModel {
    
    func viewDidLoad() {
        // self.doFetchTopHeadlingArticles()
    }
    
    func doSearch() {
        
    }
    
}

// MARK: - Private Function
extension DefaultSearchDashboardViewModel {
    
    private func doFetchSources() {
        let requestValue = FetchSourcesUseCaseRequestValue(country: "id")
        self.fetchSourcesUseCaseTask = self.fetchSourcesUseCase.execute(requestValue: requestValue, completion: { (result) in
            
        })
    }
    
    private func doFetchTopHeadlingArticles(category: String? = nil, country: String = "id", sources: String? = nil, query: String? = nil) {
        let requestValue = FetchTopHeadlineArticlesRequestValue(category: category, country: country, sources: sources, query: query)
        self.fetchTopHeadlineArticlesUseCaseTask = self.fetchTopHeadlineArticlesUseCase.execute(requestValue: requestValue) { [weak self] (result) in
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
