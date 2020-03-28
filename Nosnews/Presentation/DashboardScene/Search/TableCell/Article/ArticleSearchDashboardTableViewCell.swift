//
//  ArticleSearchDashboardTableViewCell.swift
//  Nosnews
//
//  Created by Arif Luthfiansyah on 25/03/20.
//  Copyright © 2020 Ayo Development. All rights reserved.
//

import UIKit

class ArticleSearchDashboardTableViewCell: UITableViewCell {
    static let identifier = String(describing: ArticleSearchDashboardTableViewCell.self)
    static let height = CGFloat(156)
    
    @IBOutlet weak var contentLabel: UILabel!
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var publishedDateLabel: UILabel!
    @IBOutlet weak var sourcesLabel: UILabel!
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.contentLabel.text = ""
        self.posterImageView.image = nil
        self.publishedDateLabel.text = ""
        self.sourcesLabel.text = ""
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
        self.posterImageView.round(clipToBounds: true, corner: 8)
    }
    
    func fill(with article: Article) {
        
    }
    
}
