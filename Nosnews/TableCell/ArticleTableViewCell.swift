//
//  ArticleTableViewCell.swift
//  Nosnews
//
//  Created by Arif Luthfiansyah on 28/08/19.
//  Copyright © 2019 Ayo Development. All rights reserved.
//

import Foundation
import UIKit

class ArticleTableViewCell: UITableViewCell {
    
    @IBOutlet weak var mCountryLabel: UILabel!
    @IBOutlet weak var mTitleLabel: UILabel!
    @IBOutlet weak var mImageView: UIImageView!
    @IBOutlet weak var mAuthorAndSourceLabel: UILabel!
    @IBOutlet weak var mPublishedAtLabel: UILabel!
    
    func configure(with item: Article) {
        guard
            let title = item.title,
            let imageUrl = URL(string: item.urlToImage ?? ""),
            let author = item.author,
            let source = item.source?.name,
            let publishedAt = item.publishedAt,
            let imageData = NSData(contentsOf: imageUrl)
            else { return }
        DispatchQueue.global(qos: .userInitiated).async {
            let image = imageData as Data
            DispatchQueue.main.async {
                self.mTitleLabel.text = title
                self.mImageView.image = UIImage(data: image)
                self.mAuthorAndSourceLabel.text = "\(author) from \(source)"
                self.mPublishedAtLabel.text = publishedAt
            }
        }
    }
    
}

// MARK: - Static Variable and Function
extension ArticleTableViewCell {
    
    static let heigth: CGFloat = 170
    
}
