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
}

class DashboardFlowCoordinator {
    
    private var appDelegate: AppDelegate {
        get {
            return UIApplication.shared.delegate as! AppDelegate
        }
    }
    private let navigationController: UINavigationController
    private let factory: DashboardFlowCoordinatorFactory

    init(navigationController: UINavigationController, factory: DashboardFlowCoordinatorFactory) {
        self.navigationController = navigationController
        self.factory = factory
    }
    
    func start() {
//        Uncomment the following code when you have created the Scene
//        let route = DashboardViewModelRouteClosure(pop: self.pop)
//        if let viewController = self.factory.makeDashboardViewController(route: route) as? DashboardViewController {
//            self.navigationController.pushViewController(viewController, animated: false)
//        }
    }

    private func pop() {
        
    }
    
}
