//
//  DashboardFlowCoordinator.swift
//  Nosnews
//
//  Created by Arif Luthfiansyah on 25/03/20.
//  Copyright (c) 2020 All rights reserved.
//

import Foundation
import UIKit

protocol DashboardFlowCoordinatorFactory  {
    func makeDashboardViewController(route: DashboardViewModelRouteClosure) -> UIViewController
    func makeMoviesDashboardViewController(route: MoviesDashboardViewModelRouteClosure) -> UIViewController
    func makeNewsDashboardViewController(route: NewsDashboardViewModelRouteClosure) -> UIViewController
    func makeSearchDashboardViewController(route: SearchDashboardViewModelRouteClosure) -> UIViewController
}

class DashboardFlowCoordinator {
    
    private let navigationController: UINavigationController
    private let factory: Factory

    init(navigationController: UINavigationController, factory: Factory) {
        self.navigationController = navigationController
        self.factory = factory
    }
    
    func start() {
        let route = DashboardViewModelRouteClosure(pop: self.pop)
        if let viewController = self.factory.makeDashboardViewController(route: route) as? DashboardViewController {
            
            let newsDashboardViewController = self.instantiateNewsDashboardViewController()
            let moviesDashboardViewController = self.instantiateMoviesDashboardViewController()
            let searchDashboardViewController = self.instantiateSearchDashboardViewController()
            
            let viewControllers = [ newsDashboardViewController, moviesDashboardViewController, searchDashboardViewController ].map { UINavigationController(rootViewController: $0) }
            
            viewController.viewControllers = viewControllers
            self.navigationController.setNavigationBarHidden(self.navigationController.viewControllers.isEmpty, animated: false)
            self.navigationController.pushViewController(viewController, animated: false)
        }
    }
    
    private func instantiateMoviesDashboardViewController() -> UIViewController {
        let pop = { }
        let route = MoviesDashboardViewModelRouteClosure(pop: pop)
        let viewController = self.factory.makeMoviesDashboardViewController(route: route)
        viewController.tabBarItem = UITabBarItem(tabBarSystemItem: .contacts, tag: 0)
        return viewController
    }
    
    private func instantiateNewsDashboardViewController() -> UIViewController {
        let pop = { }
        let route = NewsDashboardViewModelRouteClosure(pop: pop)
        let viewController = self.factory.makeNewsDashboardViewController(route: route)
        viewController.tabBarItem = UITabBarItem(tabBarSystemItem: .bookmarks, tag: 1)
        return viewController
    }
    
    private func instantiateSearchDashboardViewController() -> UIViewController {
        let pop = { }
        let route = SearchDashboardViewModelRouteClosure(pop: pop)
        let viewController = self.factory.makeSearchDashboardViewController(route: route)
        viewController.tabBarItem = UITabBarItem(tabBarSystemItem: .search, tag: 2)
        return viewController
    }

    private func pop() {
        
    }
    
}
