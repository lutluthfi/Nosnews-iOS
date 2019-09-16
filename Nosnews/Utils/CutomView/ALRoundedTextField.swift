//
//  SignInTextField.swfit.swift
//  HaloUstadz
//
//  Created by Arif Luthfiansyah on 12/07/19.
//  Copyright © 2019 Ayo Development. All rights reserved.
//

import Foundation
import UIKit

//
// MARK: - Delegate of ALRoundedTextField
//
protocol ALRoundedTextFieldDelegate: UITextFieldDelegate {
    func textFieldIconTouchedUp(button: UIButton)
}

//
// MARK: - ALRoundedTextField
//
@IBDesignable open class ALRoundedTextField: UITextField {
    
    //
    // MARK: - Varibales
    //
    var cornerRadiusValue: CGFloat = 0
    var corners: UIRectCorner = []
    var myDelegate: ALRoundedTextFieldDelegate? {
        get {
            return delegate as? ALRoundedTextFieldDelegate
        }
    }
    
    //
    // MARK: - Inspectable Variables
    //
    @IBInspectable public var borderWidth: CGFloat {
        get {
            return self.layer.borderWidth
        }
        set {
            self.layer.borderWidth = newValue
        }
    }
    
    @IBInspectable public var borderColor: UIColor {
        get {
            return UIColor.black
        }
        set {
            self.layer.borderColor = newValue.cgColor
        }
    }
    
    @IBInspectable public var paddingLeft: CGFloat {
        get {
            return leftView!.frame.size.width
        }
        set {
            let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: newValue, height: frame.size.height))
            leftView = paddingView
            leftViewMode = .always
        }
    }
    
    @IBInspectable public var paddingRight: CGFloat {
        get {
            return rightView!.frame.size.width
        }
        set {
            let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: newValue, height: frame.size.height))
            rightView = paddingView
            rightViewMode = .always
        }
    }
    
    @IBInspectable public var cornerRadius : CGFloat {
        get {
            return cornerRadiusValue
        }
        set {
            cornerRadiusValue = newValue
        }
    }
    
    @IBInspectable public var allSides: Bool {
        get {
            return false
        }
        set {
            if newValue {
                self.layer.cornerRadius = cornerRadiusValue
            } else {
                self.layer.cornerRadius = 0
            }
        }
    }
    
    @IBInspectable public var topLeft: Bool {
        get {
            return corners.contains(.topLeft)
        }
        set {
            setCorner(newValue: newValue, for: .topLeft)
        }
    }
    
    @IBInspectable public var topRight: Bool {
        get {
            return corners.contains(.topRight)
        }
        set {
            setCorner(newValue: newValue, for: .topRight)
        }
    }
    
    @IBInspectable public var bottomLeft: Bool {
        get {
            return corners.contains(.bottomLeft)
        }
        set {
            setCorner(newValue: newValue, for: .bottomLeft)
        }
    }
    
    @IBInspectable public var bottomRight: Bool {
        get {
            return corners.contains(.bottomRight)
        }
        set {
            setCorner(newValue: newValue, for: .bottomRight)
        }
    }
    
    @IBInspectable public var icon: UIImage? {
        didSet {
            updateTextField()
        }
    }
    
    @IBInspectable public var iconTint: UIColor? = UIColor.gray {
        didSet {
            updateTextField()
        }
    }
    
    //
    // MARK: - Override Functions
    //
    override open func leftViewRect(forBounds bounds: CGRect) -> CGRect {
        var rect = super.leftViewRect(forBounds: bounds)
        rect.origin.x = rect.origin.x + paddingLeft
        return rect
    }
    
    override open func rightViewRect(forBounds bounds: CGRect) -> CGRect {
        var rect = super.rightViewRect(forBounds: bounds)
        rect.origin.x = rect.origin.x - paddingRight
        return rect
    }
    
    //
    // MARK: - Readable Obj-C Functions
    //
    @objc func buttonTouchedUp(button: UIButton) {
        self.myDelegate?.textFieldIconTouchedUp(button: button)
    }
    
    //
    // MARK: - Functions
    //
    func setCorner(newValue: Bool, for corner: UIRectCorner) {
        if newValue {
            addRectCorner(corner: corner)
        } else {
            removeRectCorner(corner: corner)
        }
    }
    
    func addRectCorner(corner: UIRectCorner) {
        corners.insert(corner)
        updateTextField()
    }
    
    func removeRectCorner(corner: UIRectCorner) {
        if corners.contains(corner) {
            corners.remove(corner)
            updateTextField()
        }
    }
    
    func updateTextField() {
        if let image = icon {
            let button = UIButton(type: .custom)
            button.frame = CGRect(x: 0, y: 0, width: 24, height: 24)
            let iconTinted = image.withRenderingMode(.alwaysTemplate)
            button.setImage(iconTinted, for: .normal)
            button.tintColor = iconTint
            button.setTitleColor(UIColor.clear, for: .normal)
            button.addTarget(self,
                             action: #selector(buttonTouchedUp(button:)),
                             for: UIControl.Event.touchUpInside)
            button.isUserInteractionEnabled = true
        }
        
        let mask = CAShapeLayer()
        let size = CGSize(width: cornerRadiusValue, height: cornerRadiusValue)
        let path = UIBezierPath(roundedRect: self.bounds,
                                byRoundingCorners: corners,
                                cornerRadii: size)
        mask.path = path.cgPath
        mask.frame = self.bounds
        self.layer.mask = mask
    }

}
