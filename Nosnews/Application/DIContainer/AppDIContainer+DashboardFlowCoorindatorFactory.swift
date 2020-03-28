//
//  AppDIContainer+DashboardFlowCoorindatorFactory.swift
//  Nosnews
//
//  Created by Arif Luthfiansyah on 25/03/20.
//  Copyright © 2020 Ayo Development. All rights reserved.
//

import UIKit

extension AppDIContainer: DashboardFlowCoordinatorFactory {
    
    // MARK: - Dashboard
    func makeDashboardViewController(route: DashboardViewModelRouteClosure) -> UIViewController {
        return DashboardViewController.create(with: self.makeDashboardViewModel(route: route))
    }
    
    private func makeDashboardViewModel(route: DashboardViewModelRouteClosure) -> DashboardViewModel {
        return DefaultDashboardViewModel(route: route)
    }
    
    // MARK: - Movies Dashboard
    func makeMoviesDashboardViewController(route: MoviesDashboardViewModelRouteClosure) -> UIViewController {
        return MoviesDashboardViewController.create(with: self.makeMoviesDashboardViewModel(route: route))
    }
    
    private func makeMoviesDashboardViewModel(route: MoviesDashboardViewModelRouteClosure) -> MoviesDashboardViewModel {
        return DefaultMoviesDashboardViewModel(route: route)
    }
    
    // MARK: - News Dashboard
    func makeNewsDashboardViewController(route: NewsDashboardViewModelRouteClosure) -> UIViewController {
        return NewsDashboardViewController.create(with: self.makeNewsDashboardViewModel(route: route))
    }
    
    private func makeNewsDashboardViewModel(route: NewsDashboardViewModelRouteClosure) -> NewsDashboardViewModel {
        return DefaultNewsDashboardViewModel(route: route, fetchTopHeadlineArticlesUseCase: self.makeFetchTopHeadlineArticlesUseCase())
    }
    
    // MARK: - Search Dashboard
    func makeSearchDashboardViewController(route: SearchDashboardViewModelRouteClosure) -> UIViewController {
        return SearchDashboardViewController.create(with: self.makeSearchDashboardViewModel(route: route))
    }
    
    private func makeSearchDashboardViewModel(route: SearchDashboardViewModelRouteClosure) -> SearchDashboardViewModel {
        return DefaultSearchDashboardViewModel(route: route, fetchTopHeadlineArticlesUseCase: self.makeFetchTopHeadlineArticlesUseCase())
    }
    
}
