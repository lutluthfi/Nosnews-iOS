//
//  SearchDashboardViewController.swift
//  Nosnews
//
//  Created by Arif Luthfiansyah on 25/03/20.
//  Copyright (c) 2020 All rights reserved.
//

import UIKit

class SearchDashboardViewController: UIViewController, StoryboardInstantiable {
    
    lazy var searchController: UISearchController = {
        let controller = UISearchController(searchResultsController: nil)
        if #available(iOS 13.0, *) {
            controller.automaticallyShowsCancelButton = true
        }
        controller.obscuresBackgroundDuringPresentation = false
        controller.searchBar.autocapitalizationType = .words
        
        return controller
    }()
    lazy var searchTableView: UITableView = {
        let tableView = UITableView(frame: .zero)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorStyle = .singleLine
        tableView.showsVerticalScrollIndicator = false
        tableView.register(self.articleSearchDashboardTableViewCellUINib, forCellReuseIdentifier: ArticleSearchDashboardTableViewCell.identifier)
        return tableView
    }()
    lazy var searchSegmentedControl: UISegmentedControl = {
        let segmentedControl = UISegmentedControl(items: [ "News", "Movies" ])
        segmentedControl.sizeToFit()
        segmentedControl.selectedSegmentIndex = .zero
        segmentedControl.addTarget(self, action: #selector(self.onSearchSegmentedControlValueChanged(_:)), for: .valueChanged)
        return segmentedControl
    }()
    private lazy var articleSearchDashboardTableViewCellUINib: UINib = {
        return UINib(nibName: ArticleSearchDashboardTableViewCell.identifier, bundle: nil)
    }()
    
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
    
    @objc private func onSearchSegmentedControlValueChanged(_ segmentedControl: UISegmentedControl) {
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            self.title = "Search News"
            self.searchController.searchBar.placeholder = "News"
            break
        case 1:
            self.title = "Search Movies"
            self.searchController.searchBar.placeholder = "Movies"
            break
        default: break
        }
    }
    
    private func bind(to viewModel: SearchDashboardViewModel) {
    }
    
    private func setupViewDidLoad() {
        self.onSearchSegmentedControlValueChanged(self.searchSegmentedControl)
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.extendedLayoutIncludesOpaqueBars = true
        self.navigationItem.titleView = self.searchSegmentedControl
        
        self.createSearchController()
        self.createTableView()
    }
}

// MARK: - Create Function
extension SearchDashboardViewController {
    
    private func createTableView() {
        // self.searchTableView.dataSource = self
        // self.searchTableView.delegate = self
        self.view.addSubview(self.searchTableView)
        self.searchTableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: .zero).isActive = true
        self.searchTableView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: .zero).isActive = true
        self.searchTableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: .zero).isActive = true
        self.searchTableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: .zero).isActive = true
    }
    
    private func createSearchController() {
        // self.searchController.delegate = self
        // self.searchController.searchResultsUpdater = self
        // self.searchController.searchBar.delegate = self
        self.navigationItem.searchController = self.searchController
        self.navigationItem.hidesSearchBarWhenScrolling = true
        self.definesPresentationContext = true
    }
    
}
