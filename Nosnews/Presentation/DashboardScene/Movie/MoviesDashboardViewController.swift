//
//  MoviesDashboardViewController.swift
//  Nosnews
//
//  Created by Arif Luthfiansyah on 25/03/20.
//  Copyright (c) 2020 All rights reserved.
//

import UIKit

class MoviesDashboardViewController: UIViewController, StoryboardInstantiable {
    
    private var viewModel: MoviesDashboardViewModel!
    
    class func create(with viewModel: MoviesDashboardViewModel) -> MoviesDashboardViewController {
        let vc = MoviesDashboardViewController.instantiateViewController()
        vc.viewModel = viewModel
        return vc
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupViewDidLoad()
        self.bind(to: self.viewModel)
        self.viewModel.viewDidLoad()
    }
    
    private func bind(to viewModel: MoviesDashboardViewModel) {
    }
    
    private func setupViewDidLoad() {
        
    }
}
