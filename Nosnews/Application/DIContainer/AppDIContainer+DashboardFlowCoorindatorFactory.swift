//
//  AppDIContainer+DashboardFlowCoorindatorFactory.swift
//  Nosnews
//
//  Created by Arif Luthfiansyah on 25/03/20.
//  Copyright © 2020 Ayo Development. All rights reserved.
//

import UIKit

extension AppDIContainer: DashboardFlowCoordinatorFactory {
    
    func makeDashboardViewController() -> UIViewController {
        return DashboardViewController.create(with: self.makeDashboardViewModel())
    }
    
    private func makeDashboardViewModel() -> DashboardViewModel {
        return DefaultDashboardViewModel()
    }
    
    func makeMoviesDashboardViewController(route: MoviesDashboardViewModelRouteClosure) -> UIViewController {
        return MoviesDashboardViewController.create(with: self.makeMoviesDashboardViewModel(route: route))
    }
    
    private func makeMoviesDashboardViewModel(route: MoviesDashboardViewModelRouteClosure) -> MoviesDashboardViewModel {
        return DefaultMoviesDashboardViewModel(route: route)
    }
    
    func makeNewsDashboardViewController(route: NewsDashboardViewModelRouteClosure) -> UIViewController {
        return NewsDashboardViewController.create(with: self.makeNewsDashboardViewModel(route: route))
    }
    
    private func makeNewsDashboardViewModel(route: NewsDashboardViewModelRouteClosure) -> NewsDashboardViewModel {
        return DefaultNewsDashboardViewModel(route: route, fetchTopHeadlineArticlesUseCase: self.makeFetchTopHeadlineArticlesUseCase())
    }
    
    func makeSearchDashboardViewController(route: SearchDashboardViewModelRouteClosure) -> UIViewController {
        return SearchDashboardViewController.create(with: self.makeSearchDashboardViewModel(route: route))
    }
    
    private func makeSearchDashboardViewModel(route: SearchDashboardViewModelRouteClosure) -> SearchDashboardViewModel {
        return DefaultSearchDashboardViewModel(route: route)
    }
    
}
