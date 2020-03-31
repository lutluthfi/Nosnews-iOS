//
//  UIView+Loading.swift
//  Nosnews
//
//  Created by Arif Luthfiansyah on 29/03/20.
//  Copyright © 2020 Ayo Development. All rights reserved.
//

import Foundation
import UIKit

class LoadingIndicatorView: UIView {
    
    internal static var indicatorView: UIActivityIndicatorView?
    
    public static func show() {
        DispatchQueue.main.async {
            let keyWindow = UIApplication.shared.windows.filter {$0.isKeyWindow}.first
            if self.indicatorView == nil, let unwrappedKeyWindow = keyWindow {
                let size: CGSize = .init(width: 64, height: 64)
                let xPoint: CGFloat = (UIScreen.main.bounds.width / 2) - (size.width / 2)
                let yPoint: CGFloat = (UIScreen.main.bounds.height / 2) - (size.height / 2)
                let point: CGPoint = .init(x: xPoint, y: yPoint)
                let frame = CGRect(origin: point, size: size)
                let indicatorView = UIActivityIndicatorView(frame: frame)
                indicatorView.backgroundColor = UIColor.black.withAlphaComponent(0.75)
                indicatorView.style = .white
                indicatorView.round(clipToBounds: true, corner: 8)
                
                unwrappedKeyWindow.addSubview(indicatorView)
                unwrappedKeyWindow.subviews.forEach { $0.isUserInteractionEnabled = false }
                
                indicatorView.startAnimating()
                
                self.indicatorView = indicatorView
            }
        }
    }

    public static func hide() {
        DispatchQueue.main.async {
            let keyWindow = UIApplication.shared.windows.filter {$0.isKeyWindow}.first
            guard let unwrappedIndicatorView = self.indicatorView, let unwrappedKeyWindow = keyWindow else { return }
            unwrappedKeyWindow.subviews.forEach { $0.isUserInteractionEnabled = true }
            unwrappedIndicatorView.stopAnimating()
            unwrappedIndicatorView.removeFromSuperview()
            self.indicatorView = nil
        }
    }
    
}
