//
//  AppDelegate.swift
//  Nosnews
//
//  Created by Arif Luthfiansyah on 27/08/19.
//  Copyright © 2019 Ayo Development. All rights reserved.
//

import Foundation
import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    lazy var navigationController = UINavigationController()
    lazy var appDIContainer = AppDIContainer(navigationController: self.navigationController)
    lazy var appFlowCoordinator: AppFlowCoordinator = {
        return DefaultAppFlowCoordinator(
            presentationFactory: self.appDIContainer,
            navigationController: self.navigationController
        )
    }()

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.rootViewController = self.navigationController
        self.appFlowCoordinator.start()
        self.window?.makeKeyAndVisible()
        return true
    }

}

