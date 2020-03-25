//
//  ConstraintHelper.swift
//  Framework
//
//  Created by Arif Luthfiansyah on 13/07/19.
//  Copyright © 2019 Ayo Development. All rights reserved.
//

import UIKit

class ConstraintUtils: NSObject {
    
    enum ConstraintType {
        case
        leading,
        top,
        trailing,
        bottom,
        width,
        height,
        centerHorizontal,
        centerVertical
    }
    
    static func addConstraint(types: ConstraintType,
                              typesTo: NSLayoutConstraint.Attribute = .leading,
                              value: Int,
                              item: UIView,
                              toItem: UIView) -> NSLayoutConstraint {
        switch types {
        case .leading:
            return bindToLeading(item: item, toItem: toItem, cons: value, typesTo: typesTo)
        case .top:
            return bindToTop(item: item, toItem: toItem, cons: value, typesTo: typesTo)
        case .trailing:
            return bindToTrailing(item: item, toItem: toItem, cons: value, typesTo: typesTo)
        case .bottom:
            return bindToBottom(item: item, toItem: toItem, cons: value, typesTo: typesTo)
        case .height:
            return bindToHeight(item: item, cons: value)
        case .width:
            return bindToWidth(item: item, cons: value)
        case .centerHorizontal:
            return bindToCenterHorizontal(item: item, toItem: toItem, cons: value)
        case .centerVertical:
            return bindToCenterVertical(item: item, toItem: toItem, cons: value)
        }
    }
    
    private static func bindToLeading(item: UIView,
                                      toItem:UIView? = nil,
                                      cons:Int,
                                      typesTo:NSLayoutConstraint.Attribute) -> NSLayoutConstraint {
        return NSLayoutConstraint(item: item,
                                  attribute: .leading,
                                  relatedBy: .equal,
                                  toItem: toItem,
                                  attribute: typesTo,
                                  multiplier: 1,
                                  constant: CGFloat(cons))
    }
    
    private static func bindToTop(item: UIView,
                                  toItem: UIView? = nil,
                                  cons: Int,
                                  typesTo: NSLayoutConstraint.Attribute) -> NSLayoutConstraint {
        return NSLayoutConstraint(item: item,
                                  attribute: .top,
                                  relatedBy: .equal,
                                  toItem: toItem,
                                  attribute: typesTo,
                                  multiplier: 1,
                                  constant: CGFloat(cons))
    }
    
    private static func bindToTrailing(item: UIView,
                                       toItem: UIView? = nil,
                                       cons: Int,
                                       typesTo: NSLayoutConstraint.Attribute) -> NSLayoutConstraint {
        return NSLayoutConstraint(item: item,
                                  attribute: .trailing,
                                  relatedBy: .equal,
                                  toItem: toItem,
                                  attribute: typesTo,
                                  multiplier: 1,
                                  constant: CGFloat(cons))
    }
    
    private static func bindToBottom(item: UIView,
                                     toItem: UIView? = nil,
                                     cons: Int,
                                     typesTo: NSLayoutConstraint.Attribute) -> NSLayoutConstraint {
        return NSLayoutConstraint(item: item,
                                  attribute: .bottom,
                                  relatedBy: .equal,
                                  toItem: toItem,
                                  attribute: typesTo,
                                  multiplier: 1,
                                  constant: CGFloat(cons))
    }
    
    private static func bindToHeight(item: UIView,
                                     toItem: UIView? = nil,
                                     cons:Int) -> NSLayoutConstraint {
        return NSLayoutConstraint(item: item,
                                  attribute: .height,
                                  relatedBy: .equal,
                                  toItem: toItem,
                                  attribute: .height,
                                  multiplier: 1,
                                  constant: CGFloat(cons))
    }
    
    private static func bindToWidth(item: UIView,
                                    toItem: UIView? = nil,
                                    cons:Int) -> NSLayoutConstraint {
        return NSLayoutConstraint(item: item,
                                  attribute: .width,
                                  relatedBy: .equal,
                                  toItem: toItem,
                                  attribute: .width,
                                  multiplier: 1,
                                  constant: CGFloat(cons))
    }
    
    private static func bindToCenterHorizontal(item: UIView,
                                               toItem: UIView? = nil,
                                               cons: Int) -> NSLayoutConstraint {
        return NSLayoutConstraint(item: item,
                                  attribute: .centerX,
                                  relatedBy: .equal,
                                  toItem: toItem,
                                  attribute: .centerX,
                                  multiplier: 1,
                                  constant: CGFloat(cons))
    }
    
    private static func bindToCenterVertical(item: UIView,
                                             toItem: UIView? = nil,
                                             cons:Int) -> NSLayoutConstraint {
        return NSLayoutConstraint(item: item,
                                  attribute: .centerY,
                                  relatedBy: .equal,
                                  toItem: toItem,
                                  attribute: .centerY,
                                  multiplier: 1,
                                  constant: CGFloat(cons))
    }
}

