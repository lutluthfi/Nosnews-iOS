//
//  AppDIContainer.swift
//  Nosnews
//
//  Created by Arif Luthfiansyah on 25/03/20.
//  Copyright © 2020 Ayo Development. All rights reserved.
//

import Foundation
import UIKit

typealias Factory = FlowCoordinatorFactory & ViewControllerFactory
typealias ViewControllerFactory = DashboardFlowCoordinatorFactory

final class AppDIContainer {
    
    internal lazy var appConfiguration = AppConfiguration()
    internal lazy var appCoordinator = self.instantiateAppFlowCoordinator()
    
    private let navigationController: UINavigationController
    
    lazy var newsDataTransferService: DataTransferService = {
        let headers: [String: String] = [:]
        let queryParameters: [String : String] = ["api_key": appConfiguration.NewsAPIKey, "language": NSLocale.preferredLanguages.first ?? "en"]
        let config = ApiDataNetworkConfig(baseURL: URL(string: appConfiguration.NewsAPIBaseURL)!, headers: headers, queryParameters: queryParameters)
        
        let apiDataNetwork = DefaultNetworkService(config: config)
        
        return DefaultDataTransferService(with: apiDataNetwork)
    }()
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController        
    }
    
    func start() {
        self.appCoordinator.start()
    }
    
}

extension AppDIContainer: FlowCoordinatorFactory {
    
    func instantiateAppFlowCoordinator() -> AppFlowCoordinator {
        return AppFlowCoordinator(factory: self)
    }
    
    func instantiateDashboardFlowCoordinator() -> DashboardFlowCoordinator {
        return DashboardFlowCoordinator(navigationController: self.navigationController, factory: self)
    }
}
