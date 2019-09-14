//
//  ArticleTableViewCell.swift
//  Nosnews
//
//  Created by Arif Luthfiansyah on 07/09/19.
//  Copyright © 2019 Ayo Development. All rights reserved.
//

import UIKit

class ArticleTableViewCell: UITableViewCell {

    // MARK: - Component View
    @IBOutlet weak var mCountryLabel: UILabel!
    @IBOutlet weak var mTitleLabel: UILabel!
    @IBOutlet weak var SourceWithAuthorLabel: UILabel!
    @IBOutlet weak var mPublishedDateLabel: UILabel!
    @IBOutlet weak var mPosterImageView: UIImageView!
    
    
    // MARK: - UITableViewCell's Function
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    // MARK: - Public's Function
    func configure(item: Article) {
        
    }
    
}
