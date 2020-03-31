//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  Copyright (c) ___YEAR___ All rights reserved.
//

import Foundation
import UIKit

protocol ___VARIABLE_sceneIdentifier___FlowCoordinatorFactory  {
    func make___VARIABLE_sceneIdentifier___ViewController(route: ___VARIABLE_sceneIdentifier___ViewModelRouteClosure) -> UIViewController
}

class ___VARIABLE_sceneIdentifier___FlowCoordinator {
    
    private let navigationController: UINavigationController
    private let factory: ___VARIABLE_sceneIdentifier___FlowCoordinatorFactory

    init(navigationController: UINavigationController, factory: ___VARIABLE_sceneIdentifier___FlowCoordinatorFactory) {
        self.navigationController = navigationController
        self.factory = factory
    }
    
    func start() {
//        Uncomment the following code when you have created the Scene
//        let route = ___VARIABLE_sceneIdentifier___ViewModelRouteClosure(pop: self.pop)
//        if let viewController = self.factory.make___VARIABLE_sceneIdentifier___ViewController(route: route) as? ___VARIABLE_sceneIdentifier___ViewController {
//            self.navigationController.pushViewController(viewController, animated: false)
//        }
    }

    private func pop() {
        
    }
    
}
