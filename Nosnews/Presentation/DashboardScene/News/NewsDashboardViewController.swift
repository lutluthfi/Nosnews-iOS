//
//  NewsDashboardViewController.swift
//  Nosnews
//
//  Created by Arif Luthfiansyah on 25/03/20.
//  Copyright (c) 2020 All rights reserved.
//

import UIKit

class NewsDashboardViewController: UIViewController, StoryboardInstantiable {
    
    private var viewModel: NewsDashboardViewModel!
    
    class func create(with viewModel: NewsDashboardViewModel) -> NewsDashboardViewController {
        let vc = NewsDashboardViewController.instantiateViewController()
        vc.viewModel = viewModel
        return vc
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupViewDidLoad()
        self.bind(to: self.viewModel)
        self.viewModel.viewDidLoad()
    }
    
    private func bind(to viewModel: NewsDashboardViewModel) {
    }
    
    private func setupViewDidLoad() {
        
    }
}
