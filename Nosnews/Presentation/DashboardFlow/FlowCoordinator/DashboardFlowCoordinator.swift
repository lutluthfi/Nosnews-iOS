//
//  DashboardFlowCoordinator.swift
//  Nosnews
//
//  Created by Arif Luthfiansyah on 25/03/20.
//  Copyright (c) 2020 All rights reserved.
//

import UIKit

protocol DashboardFlowCoordinatorFactory  {
    func makeDashboardViewController(
        requestValue: DashboardViewModelRequestValue,
        route: DashboardViewModelRoute
    ) -> UIViewController
}

protocol DashboardFlowCoordinator {
    func start(with instructor: DashboardFlowCoordinatorInstructor)
}

enum DashboardFlowCoordinatorInstructor {
    case dashboard(DashboardViewModelRequestValue)
}

final class DefaultDashboardFlowCoordinator {
    
    let navigationController: UINavigationController
    let flowCoordinatorFactory: FlowCoordinatorFactory
    let viewControllerFactory: ViewControllerFactory

    init(navigationController: UINavigationController, presentationFactory: PresentationFactory) {
        self.navigationController = navigationController
        self.flowCoordinatorFactory = presentationFactory
        self.viewControllerFactory = presentationFactory
    }
    
    func initDashboardViewController(requestValue: DashboardViewModelRequestValue) -> UIViewController {
        let route = DashboardViewModelRoute()
        let vc = self.viewControllerFactory.makeDashboardViewController(requestValue: requestValue, route: route)
        return vc
    }
    
}

extension DefaultDashboardFlowCoordinator: DashboardFlowCoordinator {
    
    func start(with instructor: DashboardFlowCoordinatorInstructor) {
        switch instructor {
        case .dashboard(let requestValue):
            let vc = self.initDashboardViewController(requestValue: requestValue)
            self.navigationController.pushViewController(vc, animated: true)
        }
    }
    
}
