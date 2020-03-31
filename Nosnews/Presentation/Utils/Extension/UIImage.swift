//
//  UIImage.swift
//  Multi Care
//
//  Created by Arif Luthfiansyah on 29/01/20.
//  Copyright © 2020 Cartula Health. All rights reserved.
//

import Foundation
import PDFKit
import UIKit

extension UIImage {
    struct JPEGQuality {
        static let high = CGFloat(0.75)
        static let highest = CGFloat(1)
        static let low = CGFloat(0)
        static let lowes = CGFloat(0.25)
        static let medium = CGFloat(0.5)
    }
    
    func resize(targetSize: CGSize) -> UIImage {
        let size = self.size
        
        let widthRatio  = targetSize.width  / size.width
        let heightRatio = targetSize.height / size.height
        
        // Figure out what our orientation is, and use that to form the rectangle
        var newSize: CGSize
        if(widthRatio > heightRatio) {
            newSize = CGSize(width: size.width * heightRatio, height: size.height * heightRatio)
        } else {
            newSize = CGSize(width: size.width * widthRatio,  height: size.height * widthRatio)
        }
        
        // This is the rect that we've calculated out and this is what is actually used below
        let rect = CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height)
        
        // Actually do the resizing to the rect using the ImageContext stuff
        UIGraphicsBeginImageContextWithOptions(newSize, false, 1.0)
        self.draw(in: rect)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        
        return newImage!
    }
    
//    func pdf(size: CGSize = PDFGeneratorKit.PaperSize.A4) -> PDFDocument {
//        let document = PDFDocument()
//
//        guard let cgImage = self.cgImage else { return document }
//
//        let image = UIImage(cgImage: cgImage, scale: self.scale, orientation: .right).resize(targetSize: size)
//
//        guard let imagePDF = PDFPage(image: image) else { return document }
//
//        document.insert(imagePDF, at: document.pageCount)
//
//        return document
//    }
    
}
