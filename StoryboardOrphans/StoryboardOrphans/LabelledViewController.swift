//
//  LabelledViewController.swift
//  StoryboardOrphans
//
//  Created by TJ Usiyan on 2016/09/09.
//  Copyright © 2016 Buttons and Lights LLC. All rights reserved.
//

import UIKit

class LabelledViewController: UIViewController {
    var textToDisplay: String = "DIDNT SET IT"
    @IBOutlet var label: UILabel!

    override func viewWillAppear(_ animated: Bool) {
        label.text = textToDisplay
    }
}
