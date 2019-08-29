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
    @IBOutlet weak var mTableView: UITableView!
    
    // MARK: - Dependency
    private let newsViewModel = NewsViewModel()
    
    // MARK: - Variable
    var countryArticle = ""
    
    // MARK: - UIViewController's Function
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Top Headlines"
        
        self.setupTableView()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.attemptFetchHeadlines()
    }
    
    // MARK: - Private's Function
    private func attemptFetchHeadlines() {
        self.newsViewModel
            .fetchHeadlines(from: "id", in: "technology", key: R.String.apiKey) { (state) in
                switch state {
                case .success: self.onFetchHeadlinesSuccess()
                case .failure: self.onFetchHeadlineFailure()
                }
        }
    }

    private func onFetchHeadlinesSuccess() {
        self.mTableView.reloadData()
    }
    
    private func onFetchHeadlineFailure() {
        guard let message = self.newsViewModel.message else { return }
        self.showAlert(title: "Error", message: message, completion: nil)
    }
    
    private func setupCell() {
        // self.mTableView.register(ArticleTableViewCell.self, forCellReuseIdentifier: "ArticleCell")
    }
    
    private func setupTableView() {
        self.mTableView.dataSource = self
        self.mTableView.delegate = self
        self.setupCell()
    }
    
}

// MARK: - UITableViewDataSource
extension MainViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.newsViewModel.articles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleCell", for: indexPath) as! ArticleTableViewCell
        
        let article = self.newsViewModel.articles[indexPath.row]
        
        cell.configure(with: article)
        
        return cell
    }
    
}


// MARK: - UITableViewDelegate
extension MainViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return ArticleTableViewCell.heigth
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard !self.newsViewModel.articles.isEmpty else {
            return
        }
        
        let article = self.newsViewModel.articles[indexPath.row]
        
        self.showArticle(article: article)
    }
    
    func showArticle(article: Article) {
        let storyboard = UIStoryboard(name: "Article", bundle: Bundle.main)
        
        guard let viewController = storyboard.instantiateViewController(withIdentifier: "ArticleViewController") as? ArticleViewController else {
            return
        }
        
        viewController.article = article
        
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
}
