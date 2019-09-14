//
//  SearchTableViewCell.swift
//  Nosnews
//
//  Created by Arif Luthfiansyah on 06/09/19.
//  Copyright © 2019 Ayo Development. All rights reserved.
//

import UIKit

class SearchTableViewCell: UITableViewCell {

    @IBOutlet weak var mSearchBar: UISearchBar!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
