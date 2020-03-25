//
//  ArticleTableViewCell.swift
//  Nosnews
//
//  Created by Arif Luthfiansyah on 16/09/19.
//  Copyright © 2019 Ayo Development. All rights reserved.
//

import UIKit
import Kingfisher

class ArticleTableViewCell: UITableViewCell {
    
    @IBOutlet weak var mPosterImageView: UIImageView!
    @IBOutlet weak var mCountryLabel: UILabel!
    @IBOutlet weak var mTitleLabel: UILabel!
    @IBOutlet weak var mSourceAuthorLabel: UILabel!
    @IBOutlet weak var mPublishedAtLabel: UILabel!
    private let mPlaceholderImage = UIImage(asset: Asset.imagePlaceholder)
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(item: Article) {
        self.mTitleLabel.text = item.title ?? ""
        self.mSourceAuthorLabel.text = "\(item.source?.name ?? "") - \(item.author ?? "")"
        
        if let publishedAt = item.publishedAt {
            self.mPublishedAtLabel.text = DateUtils.format(date: publishedAt,
                                                           from: "yyyy-mm-dd'T'HH:mm:ss'Z'",
                                                           to: "MMM, yyyy")
        }
        
        let imageUrl = URL(string: item.urlToImage ?? "")
        
        self.mPosterImageView.kf.setImage(with: imageUrl,
                                          placeholder: self.mPlaceholderImage)
    }
    
}
