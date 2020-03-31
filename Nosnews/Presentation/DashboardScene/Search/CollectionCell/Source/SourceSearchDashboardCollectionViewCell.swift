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
    static let height = CGFloat(32)
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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = .black
        let cellCorner = SourceSearchDashboardCollectionViewCell.height / 2
        self.round(clipToBounds: true, color: nil, width: .zero, corner: cellCorner)
        self.nameLabel.textColor = .white
    }
    
    func didSelect(completion: @escaping (_ selected: Bool) -> Void ) {
        guard let unwrappedBackgroundColor = self.backgroundColor else { return }

        let cellCorner = SourceSearchDashboardCollectionViewCell.height / 2
        
        switch unwrappedBackgroundColor {
        case .black:
            self.backgroundColor = .white
            self.round(clipToBounds: true, color: UIColor.black.cgColor, width: 2, corner: cellCorner)
            self.nameLabel.font = .systemFont(ofSize: 13, weight: .semibold)
            self.nameLabel.textColor = .darkText
            completion(true)
            break
        case .white:
            self.backgroundColor = .black
            self.round(clipToBounds: true, color: nil, width: .zero, corner: cellCorner)
            self.nameLabel.font = .systemFont(ofSize: 13, weight: .regular)
            self.nameLabel.textColor = .white
            completion(false)
            break
        default: break
        }
    }
    
    func didDeselect() {
        self.backgroundColor = .black
        let cellCorner = SourceSearchDashboardCollectionViewCell.height / 2
        self.round(clipToBounds: true, color: nil, width: .zero, corner: cellCorner)
        self.nameLabel.font = .systemFont(ofSize: 13, weight: .regular)
        self.nameLabel.textColor = .white
    }
    
    func fill(with source: Source) {
        self.nameLabel.text = source.name
    }

}
