//
//  MessageViewController.swift
//  ViewLifecycle
//
//  Created by TJ Usiyan on 2016/04/10.
//  Copyright © 2016 Buttons and Lights LLC. All rights reserved.
//

import UIKit

class MessageViewController: UIViewController {

    var message: String = "UNDECIDED AND INCORRECT"
    @IBOutlet var messageLabel: UILabel!

    override func viewDidLoad() {
        print("❎MessageViewController.viewDidLoad")
        super.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        print("❎MessageViewController.viewWillAppear")
        super.viewWillAppear(animated)
        messageLabel?.text = message
    }

    override func loadView() {
        super.loadView()

        print("❎MessageViewController.loadView")

    }
}

