//
//  TableViewRefreshControlHelper.swift
//  Framework
//
//  Created by Arif Luthfiansyah on 13/07/19.
//  Copyright © 2019 Ayo Development. All rights reserved.
//

import UIKit

protocol TableViewRefreshControlDelegate {
    func tableViewDidRefresh()
}

class TableViewRefreshControlUtils: NSObject {
    
    // MARK: - Dependency
    var delegate: TableViewRefreshControlDelegate?
    private var mRefreshControl = UIRefreshControl()
    
    // MARK: - Variable
    var title: String = "Pull to refresh"
    
    func addRefresh(to tableView: UITableView) {
        self.mRefreshControl.attributedTitle =
            NSAttributedString(string: self.title,
                               attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        self.mRefreshControl.addTarget(self,
                                       action: #selector(refresh(_:)),
                                       for: UIControl.Event.valueChanged)
        self.mRefreshControl.tintColor = .white
        if #available(iOS 10.0, *) {
            tableView.refreshControl = self.mRefreshControl
        } else {
            tableView.addSubview(self.mRefreshControl)
        }
    }
    
    func endRefreshing() {
        self.mRefreshControl.endRefreshing()
    }
    
    @objc func refresh(_ sender: UITableView) {
        self.delegate?.tableViewDidRefresh()
    }
}
