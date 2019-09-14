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
    @IBOutlet weak var mSearchBar: UISearchBar!
    @IBOutlet weak var mTableView: UITableView!
    
    // MARK: - Dependency
    private let mViewModel = MainViewModel()
    private let mProgressView = ALProgressIndicatorView(withMessage: nil)
    
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
        
        self.title = "Top Headlines"
        self.mCategoryBarButtonItem.title = self.keyCategory.capitalized
        self.mCountryBarButtonItem.title = self.keyCountry.uppercased()
        
        self.setupSearchBar()
        self.setupTableView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        guard self.mTableView.visibleCells.isEmpty else {
            return
        }
        
        self.attemptFetchHeadlines(inCountry: self.keyCountry, about: self.keyCategory)
    }
    
    // MARK: - IBAction's Function
    @IBAction func onCategoryBarButtonItem(_ sender: UIBarButtonItem) {
        let storyboard = UIStoryboard(name: "Category", bundle: Bundle.main)
        
        guard let viewController = storyboard.instantiateViewController(withIdentifier: "CategoryViewController") as? CategoryViewController else {
            return
        }
        
        viewController.delegate = self
        
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    @IBAction func onCountryBarButtonTapped(_ sender: UIBarButtonItem) {
        let storyboard = UIStoryboard(name: "CountryCode", bundle: Bundle.main)
        
        guard let viewController = storyboard.instantiateViewController(withIdentifier: "CountryCodeViewController") as? CountryCodeViewController else {
            return
        }
        
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
        }
    }
    
    private func onFetchHeadlineFailure() {
        guard let message = self.mViewModel.message else { return }
        self.showAlert(title: "Error", message: message, completion: nil)
    }
    
    private func setupSearchBar() {
        self.mSearchBar.delegate = self
    }
    
    private func setupTableView() {
        self.mTableView.dataSource = self
        self.mTableView.delegate = self
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
        return self.filteredData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleCell", for: indexPath)
        
        let article = self.filteredData[indexPath.row]
        
//        for index in 0...Constant.articleCountryCode.count - 1 {
//            if (Constant.articleCountryCode[index] == self.keyCountry) {
//                cell.mCountryLabel.text = Constant.articleCountry[index]
//            }
//        }
//
//        cell.configure(with: article)
        
        return cell
    }
    
}


// MARK: - UITableViewDelegate
extension MainViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard !self.mViewModel.articles.isEmpty else {
            return
        }
        
        let article = self.mViewModel.articles[indexPath.row]
        
        self.goToArticleViewController(article: article)
    }
    
}

// MARK: - UISearchBarDelegate
extension MainViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        let data = self.mViewModel.articles
        self.filteredData = searchText.isEmpty ? data : data.filter { (item: Article) -> Bool in
            // If dataItem matches the searchText, return true to include it
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
