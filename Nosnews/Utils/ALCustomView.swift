//
//  CustomView.swift
//  HaloUstadz
//
//  Created by Arif Luthfiansyah on 13/07/19.
//  Copyright © 2019 Ayo Development. All rights reserved.
//

import UIKit

@IBDesignable open class ALCustomView: UIView {
    
    @IBInspectable var cornerRadius: Double {
        get {
            return Double(self.layer.cornerRadius)
        }set {
            self.layer.cornerRadius = CGFloat(newValue)
        }
    }
    
    @IBInspectable var borderWidth: Double {
        get {
            return Double(self.layer.borderWidth)
        }
        set {
            self.layer.borderWidth = CGFloat(newValue)
        }
    }
    
    @IBInspectable var borderColor: UIColor? {
        get {
            return UIColor(cgColor: self.layer.borderColor!)
        }
        set {
            self.layer.borderColor = newValue?.cgColor
        }
    }
    
    @IBInspectable var shadowColor: UIColor? {
        get {
            return UIColor(cgColor: self.layer.shadowColor!)
        }
        set {
            self.layer.shadowColor = newValue?.cgColor
        }
    }
    
    @IBInspectable var shadowOpacity: Float {
        get {
            return self.layer.shadowOpacity
        }
        set {
            self.layer.shadowOpacity = newValue
        }
    }
    
}

// Call this Function only, access from any where in your project
// Default values here
private let animationDuration: TimeInterval = 1.0
private let delayTime: TimeInterval = 0
private let springDamping: CGFloat = 0.25
private let lowSpringDamping: CGFloat = 0.50
private let springVelocity: CGFloat = 8.00

extension ALCustomView {
    
    //MARK:- Default Animation here
    public func AnimateView(){
        provideAnimation(animationDuration: animationDuration,
                         delayTime: delayTime,
                         springDamping: springDamping,
                         springVelocity: springVelocity)
    }
    
    //MARK:- Custom Animation here
    public func AnimateViewWithSpringDuration(name: UIView,
                                              animationDuration: TimeInterval,
                                              springDamping: CGFloat,
                                              springVelocity: CGFloat){
        provideAnimation(animationDuration: animationDuration,
                         delayTime: delayTime,
                         springDamping: springDamping,
                         springVelocity: springVelocity)
    }
    
    //MARK:- Low Damping Custom Animation here
    public func AnimateViewWithSpringDurationWithLowDamping(name: UIView,
                                                            animationDuration: TimeInterval,
                                                            springVelocity: CGFloat){
        provideAnimation(animationDuration: animationDuration,
                         delayTime: delayTime,
                         springDamping: lowSpringDamping,
                         springVelocity: springVelocity)
    }
    
    private func provideAnimation(animationDuration: TimeInterval,
                                  delayTime: TimeInterval,
                                  springDamping: CGFloat,
                                  springVelocity: CGFloat){
        self.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
        UIView.animate(withDuration: animationDuration,
                       delay: delayTime,
                       usingSpringWithDamping: springDamping,
                       initialSpringVelocity: springVelocity,
                       options: .allowUserInteraction,
                       animations: {
                        self.transform = CGAffineTransform.identity
        })
    }
    
}
