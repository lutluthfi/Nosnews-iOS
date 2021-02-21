//
//  AppFlowCoordinator.swift
//  Nosnews
//
//  Created by Arif Luthfiansyah on 25/03/20.
//  Copyright © 2020 Ayo Development. All rights reserved.
//

import Foundation
import UIKit

protocol AppFlowCoordinator {
    func start()
}

enum AppFlowCoordinatorInstructor {
    
}

final class DefaultAppFlowCoordinator: AppFlowCoordinator {
    let presentationFactory: PresentationFactory
    let navigationController: UINavigationController
    
    init(presentationFactory: PresentationFactory, navigationController: UINavigationController) {
        self.presentationFactory = presentationFactory
        self.navigationController = navigationController
    }
    
    func start() {
        let requestValue = DashboardViewModelRequestValue()
        let instructor = DashboardFlowCoordinatorInstructor.dashboard(requestValue)
        self.presentationFactory.instantiateDashboardFlowCoordinator().start(with: instructor)
    }
}
