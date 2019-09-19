//
//  ViewController.swift
//  Nosnews
//
//  Created by Arif Luthfiansyah on 27/08/19.
//  Copyright © 2019 Ayo Development. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    // MARK: - Component View
    @IBOutlet weak var mCategoryBarButtonItem: UIBarButtonItem!
    @IBOutlet weak var mCountryBarButtonItem: UIBarButtonItem!
    @IBOutlet weak var mTableView: UITableView!
    
    // MARK: - Dependency
    private let mViewModel = MainViewModel()
    private let mProgressView = ALProgressIndicatorView(withMessage: nil)
    private let mRefreshTableView = TableViewRefreshControlUtils()
    private var mSearchController = UISearchController()
    
    // MARK: - Variable
    var filteredData: [Article] = [Article]()
    var keyCategory = ""
    var keyCountry = ""
    
    // MARK: - UIViewController's Function
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if self.keyCategory.isEmpty {
            self.keyCategory = NewsPreferences.sInstances.value(defaultValue: "technology",
                                                                forKey: .categoryKey)
        }
        if self.keyCountry.isEmpty {
            self.keyCountry = NewsPreferences.sInstances.value(defaultValue: "id",
                                                               forKey: .countryKey)
        }
        
        self.mCategoryBarButtonItem.title = self.keyCategory.capitalized
        self.mCountryBarButtonItem.title = self.keyCountry.uppercased()
        
        self.setupSearchBar()
        self.setupTableView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        self.attemptFetchHeadlines(inCountry: self.keyCountry, about: self.keyCategory)
    }
    
    // MARK: - IBAction's Function
    @IBAction func onCategoryBarButtonItem(_ sender: UIBarButtonItem) {
        let viewController = StoryboardScene.Category.categoryViewController.instantiate()
        
        viewController.delegate = self
        
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    @IBAction func onCountryBarButtonTapped(_ sender: UIBarButtonItem) {
        let viewController = StoryboardScene.CountryCode.countryCodeViewController.instantiate()
        
        viewController.delegate = self
        
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    // MARK: - Private's Function
    private func attemptFetchHeadlines(inCountry countryCode: String, about category: String) {
        guard !countryCode.isEmpty, !category.isEmpty else {
            return
        }
        
        self.mProgressView.show(superView: self.view)
        
        self.mViewModel
            .fetchHeadlines(from: countryCode, in: category, key: R.String.apiKey) { (state) in
                switch state {
                case .success: self.onFetchHeadlinesSuccess()
                case .failure: self.onFetchHeadlineFailure()
                }
        }
    }
    
    private func onFetchHeadlinesSuccess() {
        DispatchQueue.main.async {
            self.filteredData = self.mViewModel.articles
            
            self.mTableView.reloadData()
            
            self.mCountryBarButtonItem.title = self.keyCountry.uppercased()
            self.mCategoryBarButtonItem.title = self.keyCategory.capitalized
            
            self.mProgressView.dismiss()
            self.mRefreshTableView.endRefreshing()
        }
    }
    
    private func onFetchHeadlineFailure() {
        guard let message = self.mViewModel.message else { return }
        self.showAlert(title: "Error", message: message, completion: nil)
    }
    
    private func setupSearchBar() {
        self.mSearchController = {
            let controller = UISearchController(searchResultsController: nil)
            controller.searchBar.sizeToFit()
            controller.searchResultsUpdater = self
            controller.dimsBackgroundDuringPresentation = false
            controller.hidesNavigationBarDuringPresentation = false
            // self.definesPresentationContext = true
            
            self.mTableView.tableHeaderView = controller.searchBar
            
            return controller
        }()
    }
    
    private func setupTableView() {
        self.setupTableViewCell()
        
        self.mRefreshTableView.delegate = self
        self.mRefreshTableView.addRefresh(to: self.mTableView, color: UIColor.black)
        
        self.mTableView.estimatedRowHeight = 200
        self.mTableView.dataSource = self
        self.mTableView.delegate = self
    }
    
    private func setupTableViewCell() {
        _ = TableViewCellUtils.registerCell(tableView: self.mTableView,
                                            nibName: "ArticleTableViewCell")
    }
    
}

// MARK: - Router
extension MainViewController {
    
    func goToArticleViewController(article: Article) {
        let storyboard = UIStoryboard(name: "Article", bundle: Bundle.main)
        
        guard let viewController = storyboard.instantiateViewController(withIdentifier: "ArticleViewController") as? ArticleViewController else {
            return
        }
        
        viewController.article = article
        
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
}

// MARK: - UITableViewDataSource
extension MainViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if self.mSearchController.isActive {
            return self.filteredData.count
        }
        
        return self.mViewModel.articles.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleTableViewCell",
                                                 for: indexPath) as! ArticleTableViewCell
        var article: Article
        
        if mSearchController.isActive {
            article = self.filteredData[indexPath.row]
        } else {
            article = self.mViewModel.articles[indexPath.row]
        }
        
        for index in 0...Constant.articleCountryCode.count - 1 {
            if (Constant.articleCountryCode[index] == self.keyCountry) {
                cell.mCountryLabel.text = Constant.articleCountry[index]
            }
        }
        
        cell.selectionStyle = .none
        cell.configure(item: article)
        
        return cell
    }
    
}


// MARK: - UITableViewDelegate
extension MainViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard !self.mViewModel.articles.isEmpty else { return }
        
        let article = self.mViewModel.articles[indexPath.row]
        
        self.goToArticleViewController(article: article)
    }
    
}

// MARK: - TableViewRefreshControlDelegate
extension MainViewController: TableViewRefreshControlDelegate {
    
    func tableViewDidRefresh() {
        guard !self.keyCountry.isEmpty, !self.keyCategory.isEmpty else {
            return
        }
        
        self.mViewModel
            .fetchHeadlines(from: self.keyCountry, in: self.keyCategory, key: R.String.apiKey) { (state) in
                switch state {
                case .success:
                    DispatchQueue.main.async {
                        self.filteredData = self.mViewModel.articles
                        
                        self.mTableView.reloadData()
                        
                        self.mCountryBarButtonItem.title = self.keyCountry.uppercased()
                        self.mCategoryBarButtonItem.title = self.keyCategory.capitalized
                        
                        self.mRefreshTableView.endRefreshing()
                    }
                case .failure:
                    DispatchQueue.main.async {
                        guard let message = self.mViewModel.message else { return }
                        self.showAlert(title: "Error", message: message, completion: nil)
                        
                        self.mRefreshTableView.endRefreshing()
                    }
                }
        }
    }
    
}

// MARK: - UISearchResultsUpdating
extension MainViewController: UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {
        self.filteredData.removeAll(keepingCapacity: false)
        
        let searchText = self.mSearchController.searchBar.text!
        let data = self.mViewModel.articles
        
        self.filteredData = searchText.isEmpty ?
            data : data.filter { (item: Article) -> Bool in
            guard let title = item.title else { return false }
            
            return title.range(of: searchText,
                               options: .caseInsensitive,
                               range: nil,
                               locale: nil) != nil
        }
        
        self.mTableView.reloadData()
    }
    
}

// MARK: - CategoryViewControllerDelegate
extension MainViewController: CategoryViewControllerDelegate {
    
    func onSelectedCategory(category: String) {
        NewsPreferences.sInstances.value(value: category, forKey: .categoryKey)
        
        let countryCode = NewsPreferences.sInstances.value(defaultValue: "id",
                                                           forKey: .countryKey)
        
        self.keyCategory = category
        
        self.attemptFetchHeadlines(inCountry: countryCode, about: category)
    }
    
}

// MARK: - CountryCodeViewControllerDelegate
extension MainViewController: CountryCodeViewControllerDelegate {
    
    func onSelectedCountryCode(countryCode: String) {
        NewsPreferences.sInstances.value(value: countryCode, forKey: .countryKey)
        
        let category = NewsPreferences.sInstances.value(defaultValue: "technology",
                                                        forKey: .categoryKey)
        
        self.keyCountry = countryCode
        
        self.attemptFetchHeadlines(inCountry: countryCode, about: category)
    }
    
}
