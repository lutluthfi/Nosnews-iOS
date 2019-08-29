//
//  ViewController+Alert.swift
//  Nosnews
//
//  Created by Arif Luthfiansyah on 28/08/19.
//  Copyright © 2019 Ayo Development. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    
    func showAlert(title head: String, message body: String, completion: (() -> Void)?) {
        let alertController = UIAlertController(title: head, message: body, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default) { action in
            completion?()
        }
        alertController.addAction(action)
        self.present(alertController, animated: true, completion: nil)
    }
    
}
