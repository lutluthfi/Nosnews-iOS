//
//  AppDIContainer+DashboardFlowCoorindatorFactory.swift
//  Nosnews
//
//  Created by Arif Luthfiansyah on 25/03/20.
//  Copyright © 2020 Ayo Development. All rights reserved.
//

import UIKit

extension AppDIContainer: DashboardFlowCoordinatorFactory { }

extension AppDIContainer {
    
    func makeDashboardViewController(
        requestValue: DashboardViewModelRequestValue,
        route: DashboardViewModelRoute
    ) -> UIViewController {
        let vm = self.makeDashboardViewModel(requestValue: requestValue, route: route)
        return DashboardViewController.create(with: vm)
    }
    
    private func makeDashboardViewModel(
        requestValue: DashboardViewModelRequestValue,
        route: DashboardViewModelRoute
    ) -> DashboardViewModel {
        return DefaultDashboardViewModel(requestValue: requestValue, route: route)
    }
    
    
}
