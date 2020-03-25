//
//  AppFlowCoordinator.swift
//  Nosnews
//
//  Created by Arif Luthfiansyah on 25/03/20.
//  Copyright © 2020 Ayo Development. All rights reserved.
//

import Foundation
import UIKit

final class AppFlowCoordinator {
    
    private let factory: Factory
    private let navigationController: UINavigationController
    
    init(factory: Factory, navigationController: UINavigationController) {
        self.factory = factory
        self.navigationController = navigationController
    }
    
    func start() {
        // Do logic like if not signed in yet go to sign in scene
        let coordinator = self.factory.instantiateDashboardFlowCoordinator()
        coordinator.start()
    }
    
}
