//
//  CategoryViewController.swift
//  Nosnews
//
//  Created by Arif Luthfiansyah on 30/08/19.
//  Copyright © 2019 Ayo Development. All rights reserved.
//

import UIKit

// MARK: - Delegate
protocol CategoryViewControllerDelegate {
    func onSelectedCategory(category: String)
}

class CategoryViewController: UIViewController {

    // MARK: - Component View
    @IBOutlet weak var mTableView: UITableView!
    
    // MARK: - Dependency
    var delegate: CategoryViewControllerDelegate?
    
    // MARK: - UIViewController's Function
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupTableView()
    }
    
    // MARK: - Private's Function
    private func setupTableView() {
        self.mTableView.dataSource = self
        self.mTableView.delegate = self
    }
}

// MARK: - UITableViewDataSource
extension CategoryViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Constant.articleCategory.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell", for: indexPath)
        let category = Constant.articleCategory[indexPath.row]
        
        cell.textLabel?.text = category
        
        return cell
    }
    
}

// MARK: - UITableViewDelegate
extension CategoryViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let delegate = delegate else { return }
        
        delegate.onSelectedCategory(category: Constant.articleCategory[indexPath.row])
        
        self.navigationController?.popViewController(animated: true)
    }
    
}
