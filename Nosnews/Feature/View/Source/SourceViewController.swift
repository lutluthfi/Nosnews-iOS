//
//  SourceViewController.swift
//  Nosnews
//
//  Created by Arif Luthfiansyah on 31/08/19.
//  Copyright © 2019 Ayo Development. All rights reserved.
//

import UIKit

class SourceViewController: UIViewController {

    // MARK: - Component View
    @IBOutlet weak var mTableView: UITableView!
    @IBOutlet weak var mSearchBar: UISearchBar!
    
    // MARK: - Variable
    var filteredData = [Source]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

}

// MARK: - UITableViewDataSource
extension SourceViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.filteredData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SourceCell", for: indexPath)
        
        return cell
    }
    
}

// MARK: - UITableViewDelegate
extension SourceViewController: UITableViewDelegate {
    
}
