//
//  UIView.swift
//  Multi Care
//
//  Created by Arif Luthfiansyah on 12/01/20.
//  Copyright © 2020 Cartula Health. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    enum LinePosition {
        case top
        case bottom
    }
    
    enum GradientDirection {
        case leadingToTrailing
        case bottomToTop
    }
    
    enum Visibility {
        case visible
        case invisible
        case gone
    }

    var visibility: Visibility {
        get {
            let constraint = (self.constraints.filter{$0.firstAttribute == .height && $0.constant == 0}.first)
            if let constraint = constraint, constraint.isActive {
                return .gone
            } else {
                return self.isHidden ? .invisible : .visible
            }
        }
        set {
            if self.visibility != newValue {
                self.setVisibility(newValue)
            }
        }
    }
    
    // MARK: - Add Line
    func addLine(position : LinePosition, color: UIColor, width: Double, space: UInt = 0) -> UIView {
        let lineView = UIView()
        lineView.backgroundColor = color
        lineView.translatesAutoresizingMaskIntoConstraints = false // This is important!
        self.addSubview(lineView)

        let metrics = ["width":NSNumber(value: width)]
        let views = ["lineView":lineView]
        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[lineView]|", options:NSLayoutConstraint.FormatOptions(rawValue: 0), metrics:metrics, views:views))

        switch position {
        case .top:
            self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[lineView(width)]", options:NSLayoutConstraint.FormatOptions(rawValue: space), metrics:metrics, views:views))
            break
        case .bottom:
            self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[lineView(width)]|", options:NSLayoutConstraint.FormatOptions(rawValue: space), metrics:metrics, views:views))
            break
        }
        
        return lineView
    }
    
    // MARK: - Circle
    func coverWithCircle(fillColor: UIColor, radius: CGFloat) {
        let arcCenter = CGPoint(x: self.bounds.height / 2, y: self.bounds.width / 2)
        let circlePath = UIBezierPath(arcCenter: arcCenter, radius: radius, startAngle: CGFloat(0), endAngle:CGFloat(Double.pi * 2), clockwise: true)
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = circlePath.cgPath
        shapeLayer.fillColor = fillColor.cgColor
        
        self.layer.addSublayer(shapeLayer)
        self.backgroundColor = .clear
    }
    
    // MARK: - Drop Shadow
    func dropShadow(scale: Bool = true, shadowOpacity: Float = 0.2, shadowRadius: CGFloat = 3) {
        self.layer.masksToBounds = false
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = shadowOpacity
        self.layer.shadowOffset = .zero
        self.layer.shadowRadius = shadowRadius
        self.layer.shouldRasterize = true
        self.layer.rasterizationScale = scale ? UIScreen.main.scale : 1
    }
    
    func addBottomShadow(scale: Bool = true, height: CGFloat = 3, shadowOpacity: Float = 0.2, shadowRadius: CGFloat = 3) {
        self.layer.masksToBounds = false
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = shadowOpacity
        self.layer.shadowOffset = CGSize(width: .zero, height: height)
        self.layer.shadowRadius = shadowRadius
        self.layer.shouldRasterize = true
        self.layer.rasterizationScale = scale ? UIScreen.main.scale : 1
    }
    
    // MARK: - Gradient
    func gradient(direction: GradientDirection = .leadingToTrailing, colors: [CGColor], corner: CGFloat = 7) {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.bounds
        gradientLayer.colors = colors
        
        switch direction {
        case .leadingToTrailing:
            gradientLayer.startPoint = CGPoint(x: 0, y: 0.5)
            gradientLayer.endPoint = CGPoint(x: 1, y: 0.5)
        case .bottomToTop:
            gradientLayer.startPoint = CGPoint(x: 0.5, y: 0.5)
            gradientLayer.endPoint = CGPoint(x: 0.5, y: 0)
        }
        
        self.layer.cornerRadius = corner
        self.layer.masksToBounds = true
        self.layer.insertSublayer(gradientLayer, at: .zero)
    }
    
    // MARK: - Instantiate
    static func initFromNib<T: UIView>() -> T {
        return Bundle.main.loadNibNamed(String(describing: self), owner: self, options: nil)?[0] as! T
    }
    
    // MARK: - Round
    func round(clipToBounds: Bool = true, color: CGColor? = nil, width: CGFloat = 1, corner: CGFloat = 7) {
        self.clipsToBounds = clipToBounds
        self.layer.cornerRadius = corner
        
        guard color != nil else { return }
        
        self.layer.borderWidth = width
        self.layer.borderColor = color
    }
    
    // MARK: - Shake
    func shake(){
        let midX = self.center.x
        let midY = self.center.y
        
        let animation = CABasicAnimation(keyPath: "position")
        animation.duration = 0.1
        animation.repeatCount = 3
        animation.autoreverses = true
        animation.fromValue = CGPoint(x: midX - 10, y: midY)
        animation.toValue = CGPoint(x: midX + 10, y: midY)
        
        self.layer.add(animation, forKey: "position")
    }
    
    // MARK: - Visibility
    private func setVisibility(_ visibility: Visibility) {
        let constraint = (self.constraints.filter{$0.firstAttribute == .height && $0.constant == 0}.first)

        switch visibility {
        case .visible:
            constraint?.isActive = false
            self.isHidden = false
            break
        case .invisible:
            constraint?.isActive = false
            self.isHidden = true
            break
        case .gone:
            if let constraint = constraint {
                constraint.isActive = true
            } else {
                let constraint = NSLayoutConstraint(item: self, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .height, multiplier: 1, constant: 0)
                self.addConstraint(constraint)
                constraint.isActive = true
            }
        }
    }
}
