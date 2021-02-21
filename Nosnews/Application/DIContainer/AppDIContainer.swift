//
//  AppDIContainer.swift
//  Nosnews
//
//  Created by Arif Luthfiansyah on 25/03/20.
//  Copyright © 2020 Ayo Development. All rights reserved.
//

import Foundation
import UIKit

typealias PresentationFactory = FlowCoordinatorFactory & ViewControllerFactory
typealias ViewControllerFactory = DashboardFlowCoordinatorFactory

final class AppDIContainer {
    
    let navigationController: UINavigationController
    
    lazy var appConfiguration = AppConfiguration()
    lazy var newsDataTransferService: DataTransferService = {
        let headers: [String: String] = [:]
        let queryParameters: [String: String] = [
            "api_key": self.appConfiguration.newsAPIKey,
            "language": NSLocale.preferredLanguages.first ?? "en"
        ]
        let baseURL = URL(string: self.appConfiguration.newsAPIBaseURL)!
        let config = ApiDataNetworkConfig(baseURL: baseURL, headers: headers, queryParameters: queryParameters)
        let apiDataNetwork = DefaultNetworkService(config: config)
        return DefaultDataTransferService(with: apiDataNetwork)
    }()
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
}
