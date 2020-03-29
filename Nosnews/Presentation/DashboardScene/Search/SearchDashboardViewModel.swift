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
    
    private let fetchSourcesUseCase: FetchSourcesUseCase
    private let fetchTopHeadlineArticlesUseCase: FetchTopHeadlineArticlesUseCase
    
    private var fetchSourcesUseCaseTask: Cancellable?
    private var fetchTopHeadlineArticlesUseCaseTask: Cancellable?
    
    private var route: SearchDashboardViewModelRouteClosure?
    
    // MARK: - OUTPUT
    let displayedArticles: Observable<[Article]> = .init([])
    let displayedSources: Observable<[Source]> = .init([])
    let selectedSource: Observable<Source?> = .init(nil)
    
    init(route: SearchDashboardViewModelRouteClosure, fetchTopHeadlineArticlesUseCase: FetchTopHeadlineArticlesUseCase, fetchSourcesUseCase: FetchSourcesUseCase) {
        self.route = route
        self.fetchTopHeadlineArticlesUseCase = fetchTopHeadlineArticlesUseCase
        self.fetchSourcesUseCase = fetchSourcesUseCase
    }
    
}

// MARK: - INPUT
extension DefaultSearchDashboardViewModel {
    
    func viewDidLoad() {
        self.doFetchSources()
    }
    
    func doSearch(query: String?) {
        if let unwrappedSelectedSource = self.selectedSource.value {
            self.doFetchTopHeadlingArticles(sources: unwrappedSelectedSource.id)
        }
    }
    
    func didSelect(source: Source) {
        self.selectedSource.value = source
    }
    
}

// MARK: - Private Function
extension DefaultSearchDashboardViewModel {
    
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
    
    private func doFetchTopHeadlingArticles(category: String? = nil, country: String = "id", sources: String? = nil, query: String? = nil) {
        let requestValue = FetchTopHeadlineArticlesRequestValue(category: category, country: country, sources: self.selectedSource.value?.id, query: query, page: "1", pageSize: "20")
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
