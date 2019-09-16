//
//  TableViewCellHelper.swift
//  Framework
//
//  Created by Arif Luthfiansyah on 13/07/19.
//  Copyright © 2019 Ayo Development. All rights reserved.
//

import UIKit

class TableViewCellUtils: NSObject {
    
    static func registerCell(collectionView: UICollectionView, nibName: String) -> UINib {
        let nib = UINib(nibName: nibName, bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: nibName)
        return nib
    }
    
    static func registerCell(tableView: UITableView, nibName: String) -> UINib {
        let nib = UINib(nibName: nibName, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: nibName)
        return nib
    }
    
    static func registerHeaderCell(tableView: UITableView, nibName: String) -> UINib {
        let nib = UINib(nibName: nibName, bundle: nil)
        tableView.register(nib, forHeaderFooterViewReuseIdentifier: nibName)
        return nib
    }
    
    static func setAccessoryCell(tableViewCell: UITableViewCell, title: String, detail: String) {
        tableViewCell.accessoryType = .disclosureIndicator
        tableViewCell.selectionStyle = .none
        tableViewCell.textLabel?.text = title
        tableViewCell.detailTextLabel?.text = detail
    }
    
}
