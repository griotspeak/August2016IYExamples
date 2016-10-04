//
//  FirstContentViewController.swift
//  UserAuth
//
//  Created by TJ Usiyan on 2016/04/10.
//  Copyright © 2016 Buttons and Lights LLC. All rights reserved.
//

import UIKit

class FirstContentViewController: UIViewController {
    
    @IBOutlet var contentLabel: UILabel!
}

extension FirstContentViewController : LoginViewControllerDelegate {
    func loginViewController(_vc: LoginViewController, didFinishLogin didFinishLoginWithPayload: String) {
        self.contentLabel.text = didFinishLoginWithPayload
    }
}
