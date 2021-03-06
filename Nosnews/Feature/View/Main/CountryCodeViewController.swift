//
//  CountryViewController.swift
//  Nosnews
//
//  Created by Arif Luthfiansyah on 30/08/19.
//  Copyright © 2019 Ayo Development. All rights reserved.
//

import UIKit

// MARK: - Delegate
protocol CountryCodeViewControllerDelegate {
    func onSelectedCountryCode(countryCode: String)
}

class CountryCodeViewController: UIViewController {

    // MARK: - Component View
    @IBOutlet weak var mTableView: UITableView!
    
    // MARK: - Dependency
    var delegate: CountryCodeViewControllerDelegate?
    
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
extension CountryCodeViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Constant.articleCountry.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CountryCodeCell", for: indexPath)
        let country = Constant.articleCountry[indexPath.row]
        
        cell.textLabel?.text = country
        
        return cell
    }
    
}

// MARK: - UITableViewDelegate
extension CountryCodeViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let delegate = delegate else { return }
        
        delegate.onSelectedCountryCode(countryCode: Constant.articleCountryCode[indexPath.row])
        
        self.navigationController?.popViewController(animated: true)
    }
    
}
