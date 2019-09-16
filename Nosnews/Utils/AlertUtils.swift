//
//  AlertHelper.swift
//  Framework
//
//  Created by Arif Luthfiansyah on 13/07/19.
//  Copyright © 2019 Ayo Development. All rights reserved.
//

import UIKit

class AlertUtils: NSObject {
    
    enum stringButton: String {
        case
        Yes = "Yes",
        Close = "Close",
        Done = "Done"
    }
    
    enum stringSignOut: String{
        case
        title = "Sign out",
        message = "Are you sure want to sign out?"
    }
    
    static func performAlertError(title: String, message:String) -> UIAlertController {
        let alert = UIAlertController.init(title: title, message: message, preferredStyle: .alert)
        alert.addAction(self.createAlertAction(title: self.stringButton.Close.rawValue, style: .cancel))
        return alert
    }
    
    static func performAlertError(title: String,
                                  message: String,
                                  action: @escaping ((UIAlertAction)->())) -> UIAlertController {
        let alert = UIAlertController.init(title: title, message: message, preferredStyle: .alert)
        alert.addAction(self.createAlertAction(title: self.stringButton.Close.rawValue,
                                               style: .default,
                                               action: action))
        return alert
    }
    
    static func pergormAlertSuccess(title: String,
                                    message:String,
                                    action: @escaping ((UIAlertAction) -> ())) -> UIAlertController {
        let alert = UIAlertController.init(title: title, message: message, preferredStyle: .alert)
        alert.addAction(self.createAlertAction(title: self.stringButton.Done.rawValue,
                                               style: .default,
                                               action: action))
        return alert
    }
    
    static func performAlertTrueFalse(title: String,
                                      message: String,
                                      actionTrue: @escaping ((UIAlertAction) -> ()),
                                      actionFalse: @escaping ((UIAlertAction) -> ())) -> UIAlertController {
        let alert = UIAlertController.init(title: title, message: message, preferredStyle: .alert)
        alert.addAction(self.createAlertAction(title: "Yes", style: .default, action: actionTrue))
        alert.addAction(self.createAlertAction(title: "No", style: .default, action: actionFalse))
        return alert
    }
    
    static func performAlertToSignOut(action: @escaping ((UIAlertAction) -> ())) -> UIAlertController {
        let alert = UIAlertController.init(title: self.stringSignOut.title.rawValue,
                                           message: self.stringSignOut.message.rawValue,
                                           preferredStyle: .actionSheet)
        alert.addAction(self.createAlertAction(title: self.stringButton.Yes.rawValue, style: .default, action: action))
        alert.addAction(self.createAlertAction(title: self.stringButton.Close.rawValue, style: .cancel))
        return alert
    }
    
    static func performAlertEditPhoto(actTake: @escaping ((UIAlertAction)->()),
                                   actChoose: @escaping ((UIAlertAction)->())) -> UIAlertController {
        let alert = UIAlertController.init(title: nil, message: nil, preferredStyle: .actionSheet)
        alert.addAction(self.createAlertAction(title: "Take Photo", style: .default, action: actTake))
        alert.addAction(self.createAlertAction(title: "Choose Photo", style: .default, action: actChoose))
        alert.addAction(self.createAlertAction(title: "Cancel", style: .cancel))
        return alert
    }
    
    static func performAlertAddCc(addCreditCard:@escaping ((UIAlertAction)->()),
                                  addWithdraw:@escaping ((UIAlertAction)->())) -> UIAlertController{
        let alert = UIAlertController.init(title: nil, message: nil, preferredStyle: .actionSheet)
        alert.addAction(self.createAlertAction(title: "Add Credit Card", style: .default, action: addCreditCard))
        alert.addAction(self.createAlertAction(title: "Add Withdraw", style: .default, action: addWithdraw))
        alert.addAction(self.createAlertAction(title: "Close", style: .cancel))
        return alert
    }
    
    static func performAlertAsking(yes: @escaping ((UIAlertAction)->()),
                                   dontask:@escaping ((UIAlertAction)->())) -> UIAlertController{
        let alert = UIAlertController.init(title: nil, message: nil, preferredStyle: .actionSheet)
        alert.addAction(self.createAlertAction(title: "Yes", style: .default, action: yes))
        alert.addAction(self.createAlertAction(title: "No", style: .default))
        alert.addAction(self.createAlertAction(title: "Don't ask again", style: .cancel, action: dontask))
        return alert
    }
    
    static func performAlertText(title: String,
                                 message: String,
                                 completion: @escaping ((_ txt:String) -> ())) -> UIAlertController{
        let alert = UIAlertController.init(title: nil, message: nil, preferredStyle: .alert)
        alert.addTextField(configurationHandler: { (textField) in
            textField.placeholder  = message
            textField.keyboardType = .numberPad
        })
        alert.title = title
        alert.message = message
        alert.addAction(self.createAlertAction(title: "Done", style: .default, action: { (a) in
            let textField = alert.textFields?[0]
            completion(textField?.text ?? "")
        }))
        
        return alert
    }
    
    static private func createAlertAction(title: String,
                                          style: UIAlertAction.Style,
                                          action: ((UIAlertAction) -> ())? = nil) -> UIAlertAction {
        let action = UIAlertAction.init(title: title, style: style, handler: action)
        return action
    }
}

