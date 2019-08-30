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
        
        let dateFormatterReceiver = DateFormatter()
        dateFormatterReceiver.dateFormat = "yyyy-MM-dd'T'HH:mm:ss'Z'"
        
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "id")
        dateFormatter.amSymbol = "am"
        dateFormatter.pmSymbol = "pm"
        dateFormatter.dateFormat = "HH:mm a - MMM, dd"
        
        let date = dateFormatterReceiver.date(from: publishedAt)
        let publishedAtDate = dateFormatter.string(from: date!)
        
        DispatchQueue.global(qos: .userInitiated).async {
            let image = imageData as Data
            DispatchQueue.main.async {
                self.mTitleLabel.text = title
                self.mImageView.image = UIImage(data: image)
                self.mAuthorAndSourceLabel.text = "\(author) - \(source)"
                self.mPublishedAtLabel.text = publishedAtDate
            }
        }
    }
    
}

// MARK: - Static Variable and Function
extension ArticleTableViewCell {
    
    static let heigth: CGFloat = 170
    
}
