//
//  ALProgressIndicatorView.swift
//  HaloUstadz
//
//  Created by Arif Luthfiansyah on 25/07/19.
//  Copyright © 2019 Ayo Development. All rights reserved.
//

import Foundation
import UIKit

class ALProgressIndicatorView: UIVisualEffectView {
    
    //
    // MARK: - Variables
    //
    var message: String? {
        didSet {
            messageLabel.text = message
            messageLabel.textColor = UIColor(named: "ColorText")!
        }
    }
    
    //
    // MARK: - Properties
    //
    let blurEffect = UIBlurEffect(style: .dark)
    let containerView = UIView()
    let messageLabel: UILabel = UILabel()
    let defaultIndicatorView = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.gray)
    
    //
    // MARK: - Init Functions
    //
    init(with message: String) {
        self.message = message
        super.init(effect: blurEffect)
        self.isUserInteractionEnabled = false
        self.addingComponents()
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.message = ""
        super.init(coder: aDecoder)
        self.isUserInteractionEnabled = true
        self.addingComponents()
    }
    
    //
    // MARK: - Overried Functions
    //
    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        if let window = self.window {
            //// Adjust to frame of window
            self.frame = window.frame
            //// Define height and width of container progress indicator
            let containerHeight: CGFloat = 72.0
            let containerWidth: CGFloat = window.frame.size.width / 1.5 // 276 on iPhone Xr
            //// Define frame of container progress indicator
            self.containerView.frame = CGRect(x: window.frame.size.width / 2 - containerWidth / 2,
                                              y: window.frame.size.height / 2,
                                              width: containerWidth,
                                              height: containerHeight)
            //// Define background color of container view
            self.containerView.backgroundColor = UIColor.white
            
            //// Define size and rectangle of indicator
            let indicatorSize: CGFloat = 32.0
            
            //// Define frame of default indicator view
            self.defaultIndicatorView.frame = CGRect(x: 16,
                                                     y: containerHeight / 2 - indicatorSize / 2,
                                                     width: indicatorSize,
                                                     height: indicatorSize)
            self.containerView.layer.cornerRadius = 8.0
            self.containerView.layer.masksToBounds = true
            
            self.messageLabel.text = self.message
            self.messageLabel.textAlignment = NSTextAlignment.center
            self.messageLabel.frame = CGRect(x: indicatorSize + 5,
                                        y: 0,
                                        width: containerWidth - indicatorSize - 15,
                                        height: containerHeight)
            self.messageLabel.textColor = UIColor(named: "ColorText")!
            self.messageLabel.font = UIFont(name: "System", size: 18)
        }
    }
    
    //
    // MARK: - Private Functions
    //
    private func addingComponents() {
        self.contentView.addSubview(self.containerView)
        self.containerView.addSubview(self.messageLabel)
        self.containerView.addSubview(self.defaultIndicatorView)
        self.defaultIndicatorView.startAnimating()
    }
}
