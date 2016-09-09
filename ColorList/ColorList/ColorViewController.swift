//
//  ColorViewController.swift
//  ColorList
//
//  Created by TJ Usiyan on 2016/09/09.
//  Copyright © 2016 Buttons and Lights LLC. All rights reserved.
//

import UIKit

class ColorViewController: UIViewController, UITextFieldDelegate {
    var color: Color?
    @IBOutlet var nameField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        nameField.delegate = self
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        view.backgroundColor = color!.rawRepresentation
        let name = color!.name
        nameField.text = name
        self.title = name

    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        guard let newName = textField.text, !newName.isEmpty else {
            return false
        }

        color!.name = newName
        self.title = newName

        textField.resignFirstResponder()

        return true
    }
}
