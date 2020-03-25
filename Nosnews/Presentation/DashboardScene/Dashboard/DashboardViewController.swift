//
//  DashboardViewController.swift
//  Nosnews
//
//  Created by Arif Luthfiansyah on 25/03/20.
//  Copyright (c) 2020 All rights reserved.
//

import UIKit

class DashboardViewController: UIViewController, StoryboardInstantiable {
    
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
        self.viewModel.viewDidLoad()
    }
    
    private func bind(to viewModel: DashboardViewModel) {
    }
    
    private func setupViewDidLoad() {
        
    }
}
