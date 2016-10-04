//
//  LoginViewController.swift
//  UserAuth
//
//  Created by TJ Usiyan on 2016/04/10.
//  Copyright © 2016 Buttons and Lights LLC. All rights reserved.
//

import UIKit


protocol LoginViewControllerDelegate {
    func loginViewController(_vc: LoginViewController, didFinishLogin payload: String)
}

class LoginViewController: UIViewController {
    var delegate: LoginViewControllerDelegate?
    @IBOutlet var payloadField: UITextField!
    @IBAction func doIt(_ sender: AnyObject) {
        delegate?.loginViewController(_vc: self, didFinishLogin: payloadField.text!)
        presentingViewController?.dismiss(animated: true, completion: nil)
    }
}




