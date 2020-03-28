//
//  ArticleSearchDashboardTableViewCell.swift
//  Nosnews
//
//  Created by Arif Luthfiansyah on 25/03/20.
//  Copyright © 2020 Ayo Development. All rights reserved.
//

import Kingfisher
import UIKit

class ArticleSearchDashboardTableViewCell: UITableViewCell {
    static let identifier = String(describing: ArticleSearchDashboardTableViewCell.self)
    static let height = CGFloat(132)
    
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var publishedDateLabel: UILabel!
    @IBOutlet weak var sourceLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.titleLabel.text = ""
        self.posterImageView.image = nil
        self.publishedDateLabel.text = ""
        self.sourceLabel.text = ""
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
        self.posterImageView.round(clipToBounds: true, corner: 8)
    }
    
    func fill(with article: Article) {
        self.sourceLabel.text = article.source.name
        self.titleLabel.text = article.title
        self.posterImageView.kf.setImage(with: URL(string: article.urlToImage))
        self.publishedDateLabel.text = article.publishedAt
    }
    
}
