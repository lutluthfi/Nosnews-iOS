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
            
            viewController.viewControllers = [ newsDashboardViewController, moviesDashboardViewController, searchDashboardViewController ]
            viewController.selectedIndex = 1
            viewController.selectedViewController = newsDashboardViewController
            
            self.navigationController.pushViewController(viewController, animated: false)
        }
    }
    
    private func instantiateMoviesDashboardViewController() -> UIViewController {
        let pop = { }
        let route = MoviesDashboardViewModelRouteClosure(pop: pop)
        let viewController = self.factory.makeMoviesDashboardViewController(route: route)
        viewController.tabBarItem = UITabBarItem(title: "Movies", image: nil, selectedImage: nil)
        return viewController
    }
    
    private func instantiateNewsDashboardViewController() -> UIViewController {
        let pop = { }
        let route = NewsDashboardViewModelRouteClosure(pop: pop)
        let viewController = self.factory.makeNewsDashboardViewController(route: route)
        viewController.tabBarItem = UITabBarItem(title: "News", image: nil, selectedImage: nil)
        return viewController
    }
    
    private func instantiateSearchDashboardViewController() -> UIViewController {
        let pop = { }
        let route = SearchDashboardViewModelRouteClosure(pop: pop)
        let viewController = self.factory.makeSearchDashboardViewController(route: route)
        viewController.tabBarItem = UITabBarItem(title: "Search", image: nil, selectedImage: nil)
        return viewController
    }

    private func pop() {
        
    }
    
}
