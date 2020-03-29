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
    
    func doSearch(query: String?)
    func didSelect(source: Source)
}

protocol SearchDashboardViewModelOutput {
    var displayedArticles: Observable<[Article]> { get }
    var displayedSources: Observable<[Source]> { get }
    var selectedSource: Observable<Source?> { get }
}

protocol SearchDashboardViewModel: SearchDashboardViewModelInput, SearchDashboardViewModelOutput { }

class DefaultSearchDashboardViewModel: SearchDashboardViewModel {
    
    private let fetchEverythingArticlesUseCase: FetchEverythingArticlesUseCase
    private let fetchSourcesUseCase: FetchSourcesUseCase
    
    private var fetchSourcesUseCaseTask: Cancellable?
    private var fetchEverythingArticlesUseCaseTask: Cancellable?
    
    private var route: SearchDashboardViewModelRouteClosure?
    
    // MARK: - OUTPUT
    let displayedArticles: Observable<[Article]> = .init([])
    let displayedSources: Observable<[Source]> = .init([])
    let selectedSource: Observable<Source?> = .init(nil)
    
    init(route: SearchDashboardViewModelRouteClosure, fetchEverythingArticlesUseCase: FetchEverythingArticlesUseCase, fetchSourcesUseCase: FetchSourcesUseCase) {
        self.route = route
        self.fetchEverythingArticlesUseCase = fetchEverythingArticlesUseCase
        self.fetchSourcesUseCase = fetchSourcesUseCase
    }
    
}

// MARK: - INPUT
extension DefaultSearchDashboardViewModel {
    
    func viewDidLoad() {
        self.doFetchSources()
    }
    
    func doSearch(query: String?) {
        if let unwrappedQuery = query {
            self.doFetchEverything(sources: self.selectedSource.value?.id, page: 1, pageSize: 20, query: unwrappedQuery)
        }
    }
    
    func didSelect(source: Source) {
        self.selectedSource.value = source
    }
    
}

// MARK: - Private Function
extension DefaultSearchDashboardViewModel {
    
    private func doFetchEverything(domains: String? = nil, fromDateString: String? = nil, sortBy: String? = nil, sources: String? = nil, toDateString: String? = nil, page: Int, pageSize: Int, query: String) {
        let requestValue = FetchEverythingArticlesUseCaseRequestValue(domains: domains, fromDateString: fromDateString, sortBy: sortBy, sources: sources, toDateString: toDateString, page: page, pageSize: pageSize, query: query)
        self.fetchEverythingArticlesUseCaseTask = self.fetchEverythingArticlesUseCase.execute(requestValue: requestValue, completion: { [weak self] (result) in
            guard let unwrappedSelf = self else { return }
            switch result {
            case .success(let response):
                unwrappedSelf.displayedArticles.value = response
                break
            case .failure(_): break
            }
        })
    }
    
    private func doFetchSources() {
        let requestValue = FetchSourcesUseCaseRequestValue(category: nil, country: nil)
        self.fetchSourcesUseCaseTask = self.fetchSourcesUseCase.execute(requestValue: requestValue, completion: { [weak self] (result) in
            guard let unwrappedSelf = self else { return }
            switch result {
            case .success(let response):
                unwrappedSelf.displayedSources.value = response.sources
                break
            case .failure(_): break
            }
        })
    }
    
}
