//
//  SearchDashboardViewController.swift
//  Nosnews
//
//  Created by Arif Luthfiansyah on 25/03/20.
//  Copyright (c) 2020 All rights reserved.
//

import UIKit

class SearchDashboardViewController: UIViewController, StoryboardInstantiable {
    struct SearchTableView {
        struct Section {
            static let news = 0
            static let movies = 1
        }
        
        static let segments: [String] = [ "News", "Movies" ]
    }
    
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
        let segmentedControl = UISegmentedControl(items: SearchTableView.segments)
        segmentedControl.sizeToFit()
        segmentedControl.selectedSegmentIndex = .zero
        segmentedControl.addTarget(self, action: #selector(self.onSearchSegmentedControlValueChanged(_:)), for: .valueChanged)
        return segmentedControl
    }()
    private lazy var articleSearchDashboardTableViewCellUINib: UINib = {
        return UINib(nibName: ArticleSearchDashboardTableViewCell.identifier, bundle: nil)
    }()
    
    private var viewModel: SearchDashboardViewModel!
    
    private var displayedArticles: [Article] = []
    
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
        self.title = "Search \(SearchTableView.segments[segmentedControl.selectedSegmentIndex])"
        self.searchController.searchBar.placeholder = SearchTableView.segments[segmentedControl.selectedSegmentIndex]
    }
    
    private func bind(to viewModel: SearchDashboardViewModel) {
        viewModel.displayedArticles.observe(on: self) { [weak self] in self?.observeDisplayedArticlesViewModel($0) }
    }
    
    private func setupViewDidLoad() {
        self.onSearchSegmentedControlValueChanged(self.searchSegmentedControl)
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.extendedLayoutIncludesOpaqueBars = true
        self.navigationItem.titleView = self.searchSegmentedControl
        
        self.createSearchController()
        self.createTableView()
    }
    
    private func observeDisplayedArticlesViewModel(_ displayedArticles: [Article]) {
        self.displayedArticles = displayedArticles
        
        let indexSet = IndexSet(integer: SearchTableView.Section.news)
        self.searchTableView.reloadSections(indexSet, with: .none)
    }
    
}

// MARK: - Create Function
extension SearchDashboardViewController {
    
    private func createTableView() {
        self.searchTableView.dataSource = self
        self.searchTableView.delegate = self
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

// MARK: - UITableViewDataSource, UITableViewDelegate
extension SearchDashboardViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == self.searchTableView {
            switch self.searchSegmentedControl.selectedSegmentIndex {
            case SearchTableView.Section.news: return self.displayedArticles.count
            case SearchTableView.Section.movies: return .zero
            default: return .zero
            }
        }
        
        return .zero
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if tableView == self.searchTableView {
            switch self.searchSegmentedControl.selectedSegmentIndex {
            case SearchTableView.Section.news: return ArticleSearchDashboardTableViewCell.height
            default: return .zero
            }
        }
        
        return .zero
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == self.searchTableView {
            if self.searchSegmentedControl.selectedSegmentIndex == SearchTableView.Section.news {
                guard let cell = tableView.dequeueReusableCell(withIdentifier: ArticleSearchDashboardTableViewCell.identifier, for: indexPath) as? ArticleSearchDashboardTableViewCell else {
                    fatalError("Cannot dequeue reusable cell \(ArticleSearchDashboardTableViewCell.identifier) with reuseIdentifier \(ArticleSearchDashboardTableViewCell.identifier)")
                }
                
                let article = self.displayedArticles[indexPath.row]
                cell.fill(with: article)
                
                return cell
            }
        }
        
        return UITableViewCell()
    }
    
}
