//
//  FlowCoordinatorFactory.swift
//  Nosnews
//
//  Created by Arif Luthfiansyah on 25/03/20.
//  Copyright © 2020 Ayo Development. All rights reserved.
//

import Foundation

protocol FlowCoordinatorFactory {
    func instantiateAppFlowCoordinator() -> AppFlowCoordinator
    func instantiateDashboardFlowCoordinator() -> DashboardFlowCoordinator
}
