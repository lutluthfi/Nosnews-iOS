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
    lazy var sourceCollectionView: UICollectionView = {
        let collectionViewFlowLayout = UICollectionViewFlowLayout()
        collectionViewFlowLayout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewFlowLayout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = .clear
        collectionView.register(self.sourceSearchDashboardCollectionViewCellUINib, forCellWithReuseIdentifier: SourceSearchDashboardCollectionViewCell.identifier)
        return collectionView
    }()
    
    private lazy var articleSearchDashboardTableViewCellUINib: UINib = {
        return UINib(nibName: ArticleSearchDashboardTableViewCell.identifier, bundle: nil)
    }()
    private lazy var sourceSearchDashboardCollectionViewCellUINib: UINib = {
        return UINib(nibName: SourceSearchDashboardCollectionViewCell.identifier, bundle: nil)
    }()
    
    private var viewModel: SearchDashboardViewModel!
    
    private var displayedArticles: [Article] = []
    private var displayedSources: [Source] = []
    
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
        viewModel.displayedSources.observe(on: self) { [weak self] in
            self?.observeDisplayedSourcesViewModel($0)
        }
    }
    
    private func setupViewDidLoad() {
        self.onSearchSegmentedControlValueChanged(self.searchSegmentedControl)
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.extendedLayoutIncludesOpaqueBars = true
        self.navigationItem.titleView = self.searchSegmentedControl
        
        self.createSearchController()
        self.createTableView()
        self.createSourceCollectionView()
    }
    
    private func observeDisplayedArticlesViewModel(_ displayedArticles: [Article]) {
        self.displayedArticles = displayedArticles
        
        self.searchTableView.reloadData()
    }
    
    private func observeDisplayedSourcesViewModel(_ displayedSources: [Source]) {
        self.displayedSources = displayedSources
        
        self.sourceCollectionView.reloadData()
    }
    
}

// MARK: - Create Function
extension SearchDashboardViewController {
    
    private func createSearchController() {
        // self.searchController.delegate = self
        // self.searchController.searchResultsUpdater = self
        // self.searchController.searchBar.delegate = self
        self.navigationItem.searchController = self.searchController
        self.navigationItem.hidesSearchBarWhenScrolling = true
        self.definesPresentationContext = true
    }
    
    private func createSourceCollectionView() {
        self.sourceCollectionView.dataSource = self
        self.sourceCollectionView.delegate = self
        self.view.addSubview(self.sourceCollectionView)
        self.sourceCollectionView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        self.sourceCollectionView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        self.sourceCollectionView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        self.sourceCollectionView.heightAnchor.constraint(equalToConstant: 44).isActive = true
    }
    
    private func createTableView() {
        self.searchTableView.dataSource = self
        self.searchTableView.delegate = self
        self.view.addSubview(self.searchTableView)
        self.searchTableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        self.searchTableView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        self.searchTableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        self.searchTableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
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

// MARK: - UICollectionViewDataSource, UICollectionViewDelegate
extension SearchDashboardViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == self.sourceCollectionView {
            let sourceName = self.displayedSources[indexPath.row].name
            let width = sourceName.size(withAttributes: [ NSAttributedString.Key.font : UIFont.systemFont(ofSize: 13, weight: .regular) ]).width + 16
            return CGSize(width: width, height: SourceSearchDashboardCollectionViewCell.height)
        }
        
        return .zero
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        if collectionView == self.sourceCollectionView {
            return .init(top: .zero, left: 8, bottom: .zero, right: 8)
        }
        
        return .zero
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.sourceCollectionView {
            return self.displayedSources.count
        }
        
        return .zero
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == self.sourceCollectionView {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SourceSearchDashboardCollectionViewCell.identifier, for: indexPath) as? SourceSearchDashboardCollectionViewCell else {
                fatalError("Cannot dequeue reusable cell \(SourceSearchDashboardCollectionViewCell.identifier) with reuseIdentifier \(SourceSearchDashboardCollectionViewCell.identifier)")
            }
            
            let source = self.displayedSources[indexPath.row]
            cell.fill(with: source)
            
            return cell
        }
        
        return UICollectionViewCell()
    }
    
}
