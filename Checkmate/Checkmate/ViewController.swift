//
//  ViewController.swift
//  Checkmate
//
//  Created by TJ Usiyan on 2016/05/10.
//  Copyright © 2016 Buttons and Lights LLC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
}

extension ViewController : UserAuthViewControllerDelegate {
    func loginViewController(_ controller: UIViewController, successfullyAuthenticated user: User) {
        print("SUCCESS! WOOOOO : \(user)")
        controller.presentingViewController?.dismiss(animated: true, completion: nil)
    }
}

