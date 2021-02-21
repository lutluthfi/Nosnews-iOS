//
//  DashboardViewController.swift
//  Nosnews
//
//  Created by Arif Luthfiansyah on 21/02/21.
//  Copyright (c) 2021 All rights reserved.
//
//  Template:
//  Modified by Arif Luthfiansyah
//  Created by Oleh Kudinov

import UIKit

// MARK: DashboardViewController
final class DashboardViewController: UIViewController {

    // MARK: DI Variable
    lazy var _view: DashboardView = {
        return DashboardView(
            navigationBar: self.navigationController?.navigationBar,
            navigationItem: self.navigationItem
        )
    }()
    var viewModel: DashboardViewModel!

    // MARK: Common Variable


    // MARK: Create Function
    class func create(with viewModel: DashboardViewModel) -> DashboardViewController {
        let vc = DashboardViewController()
        vc.viewModel = viewModel
        return vc
    }

    // MARK: UIViewController Function
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupViewDidLoad()
        self.bind(to: self.viewModel)
        self.viewModel.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.setupViewWillAppear()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.setupViewWillDisappear()
    }

    // MARK: Bind ViewModel Function
    private func bind(to viewModel: DashboardViewModel) {
    }

    // MARK: SetupView By Lifecycle Function
    private func setupViewDidLoad() {
        self.view = self._view
        self._view.backgroundColor = .red
    }
    
    private func setupViewWillAppear() {
        self._view.viewWillAppear()
    }
    
    private func setupViewWillDisappear() {
        self._view.viewWillDisappear()
    }
    
}

// MARK: Observe ViewModel Function
private extension DashboardViewController {

}
