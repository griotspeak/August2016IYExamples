//
//  ViewController.swift
//  MadLib
//
//  Created by TJ Usiyan on 2016/08/09.
//  Copyright © 2016 Buttons and Lights LLC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var state: MadLibState?
    @IBOutlet var textField: UITextField!
    @IBOutlet var addItemButton: UIButton!
    @IBOutlet var madLibButton: UIButton!


    @IBAction func addItem(_ sender: AnyObject) {
        guard let newText = textField?.text, newText.isEmpty == false else {
            return
        }

        switch state! {
        case .noStrings:
            state = .oneString(newText)
        case let .oneString(first):
            state = .twoStrings(first, newText)
        case .twoStrings:
            fatalError("impossible")
        }

        updateUsingModel()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        state = .noStrings
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateUsingModel()
    }

    func updateUsingModel() {
        switch state! {
        case .noStrings:
            madLibButton.isHidden = true
            addItemButton.isHidden = false
            textField.isHidden = false
            textField.text = ""
            textField.placeholder = "Enter first word"
        case .oneString:
            madLibButton.isHidden = true
            addItemButton.isHidden = false
            textField.isHidden = false
            textField.text = ""
            textField.placeholder = "Enter second word"
        case .twoStrings:
            madLibButton.isHidden = false
            addItemButton.isHidden = true
            textField.isHidden = true
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func showMadLib(_ sender: AnyObject) {
        let storyVC = StoryViewController()
        guard case let .twoStrings(first, second)? = state else {
            fatalError("How Sway?")
        }

        storyVC.model = (first, second)

        show(storyVC, sender: nil)
    }
}

