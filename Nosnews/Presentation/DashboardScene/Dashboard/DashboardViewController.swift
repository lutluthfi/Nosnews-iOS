//
//  DashboardViewController.swift
//  Nosnews
//
//  Created by Arif Luthfiansyah on 25/03/20.
//  Copyright (c) 2020 All rights reserved.
//

import UIKit

protocol DashboardViewControllerShared {
    var route: DashboardViewModelRoute? { get set }
}

class DashboardViewController: UITabBarController, StoryboardInstantiable, DashboardViewControllerShared {
    
    var route: DashboardViewModelRoute?
    
    private var viewModel: DashboardViewModel!
    
    class func create(with viewModel: DashboardViewModel) -> DashboardViewController {
        let vc = DashboardViewController.instantiateViewController()
        vc.viewModel = viewModel
        return vc
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupViewDidLoad()
        self.bind(to: self.viewModel)
        self.viewModel.routing(with: self.route)
        self.viewModel.viewDidLoad()
    }
    
    private func bind(to viewModel: DashboardViewModel) {
    }
    
    private func setupViewDidLoad() {
        
    }
}
