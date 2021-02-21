//
//  AppDIContainer+FlowCoordinatorFactory.swift
//  Nosnews
//
//  Created by Arif Luthfiansyah on 21/02/21.
//  Copyright © 2021 Ayo Development. All rights reserved.
//

import Foundation

extension AppDIContainer: FlowCoordinatorFactory {
    
    func instantiateAppFlowCoordinator() -> AppFlowCoordinator {
        return DefaultAppFlowCoordinator(presentationFactory: self, navigationController: self.navigationController)
    }
    
    func instantiateDashboardFlowCoordinator() -> DashboardFlowCoordinator {
        return DefaultDashboardFlowCoordinator(navigationController: self.navigationController, presentationFactory: self)
    }
}
