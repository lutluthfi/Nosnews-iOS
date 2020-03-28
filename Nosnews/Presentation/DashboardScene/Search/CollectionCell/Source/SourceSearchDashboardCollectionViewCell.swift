//
//  SourceSearchDashboardCollectionViewCell.swift
//  Nosnews
//
//  Created by Arif Luthfiansyah on 28/03/20.
//  Copyright © 2020 Ayo Development. All rights reserved.
//

import UIKit

class SourceSearchDashboardCollectionViewCell: UICollectionViewCell {
    static let identifier = String(describing: SourceSearchDashboardCollectionViewCell.self)
    static let height = CGFloat(24)
    static let width = CGFloat(64)
    
    @IBOutlet weak var nameLabel: UILabel!
    
    lazy var blurEffect: UIBlurEffect = {
        return .init(style: .dark)
    }()
    lazy var blurVisualEffectView: UIVisualEffectView = {
        let view = UIVisualEffectView(effect: self.blurEffect)
        view.frame = self.bounds
        view.autoresizingMask = [ .flexibleWidth, .flexibleHeight ]
        return view
    }()
    
//    override func prepareForReuse() {
//        super.prepareForReuse()
//        self.nameLabel.text = ""
//        for (index, view) in self.subviews.enumerated() {
//            if view == self.blurVisualEffectView {
//                self.subviews.remove(at: index)
//                break
//            }
//        }
//    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.insertSubview(self.blurVisualEffectView, at: .zero)
        let cellCorner = SourceSearchDashboardCollectionViewCell.height / 2
        self.round(clipToBounds: true, corner: cellCorner)
        self.nameLabel.textColor = .white
    }
    
    func fill(with source: Source) {
        self.nameLabel.text = source.name
    }

}
