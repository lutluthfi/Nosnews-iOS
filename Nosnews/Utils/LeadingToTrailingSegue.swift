//
//  LeadingToTrailingSegue.swift
//  Reading
//
//  Created by Arif Luthfiansyah on 03/08/19.
//  Copyright © 2019 Ayo Development. All rights reserved.
//

import Foundation
import UIKit

class LeadingToTrailingSegue: UIStoryboardSegue {
    
    override func perform() {
        let source = self.source
        let destination = self.destination
        
        source.view.superview?.insertSubview(destination.view, aboveSubview: source.view)
        destination.view.transform = CGAffineTransform(translationX: source.view.frame.size.width, y: 0)

        UIView.animate(withDuration: 0.25,
                       delay: 0.0,
                       options: .curveEaseInOut,
                       animations: { destination.view.transform = CGAffineTransform(translationX: 0, y: 0) },
                       completion: { finished in source.present(destination, animated: false, completion: nil) })
    }
    
}
