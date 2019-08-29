//
//  PostLaunchViewController.swift
//  Nosnews
//
//  Created by Arif Luthfiansyah on 27/08/19.
//  Copyright © 2019 Ayo Development. All rights reserved.
//

import UIKit

class PostLaunchViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        Timer.scheduledTimer(timeInterval: 2,
                             target: self,
                             selector: #selector(goToMainViewController),
                             userInfo: nil,
                             repeats: false)
    }
    
    @objc private func goToMainViewController() {
        self.performSegue(withIdentifier: "goToMainSegue", sender: self)
    }

}
