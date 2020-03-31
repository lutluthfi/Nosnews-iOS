//
//  UILabel.swift
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  Copyright (c) ___YEAR___ All rights reserved.
//

import Foundation
import UIKit

extension UILabel {
    
    func isTruncated() -> Bool {
        guard let text = text, !text.isEmpty else { return false }
        
        let size: CGSize = text.size(withAttributes: [ NSAttributedString.Key.font: font! ] )
        return size.width > self.bounds.size.width
    }
    
    
    func setHTMLString(htmlText: String) {
        let modifiedFont = String(format:"<span style=\"font-family: '-apple-system'; font-size: \(self.font!.pointSize)\">%@</span>", htmlText)
        
        let attrStr = try! NSAttributedString(
            data: modifiedFont.data(using: .unicode, allowLossyConversion: true)!,
            options: [.documentType: NSAttributedString.DocumentType.html, .characterEncoding:String.Encoding.utf8.rawValue],
            documentAttributes: nil)
        
        self.attributedText = attrStr
    }
    
}
