//
//  SearchDashboardViewController.swift
//  Nosnews
//
//  Created by Arif Luthfiansyah on 25/03/20.
//  Copyright (c) 2020 All rights reserved.
//

import UIKit

class SearchDashboardViewController: UIViewController, StoryboardInstantiable {
    
    private var viewModel: SearchDashboardViewModel!
    
    class func create(with viewModel: SearchDashboardViewModel) -> SearchDashboardViewController {
        let vc = SearchDashboardViewController.instantiateViewController()
        vc.viewModel = viewModel
        return vc
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupViewDidLoad()
        self.bind(to: self.viewModel)
        self.viewModel.viewDidLoad()
    }
    
    private func bind(to viewModel: SearchDashboardViewModel) {
    }
    
    private func setupViewDidLoad() {
        
    }
}
