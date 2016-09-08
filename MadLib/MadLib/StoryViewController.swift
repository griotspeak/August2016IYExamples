//
//  StoryViewController.swift
//  MadLib
//
//  Created by TJ Usiyan on 2016/08/09.
//  Copyright © 2016 Buttons and Lights LLC. All rights reserved.
//

import UIKit

class StoryViewController: UIViewController {
    
    @IBOutlet var label: UILabel!
    internal var model: (String, String)?

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        guard let (first, second) = model else {
            fatalError("the impossible has happened")
        }

        label.text = "\(first) was your first word. \(second) was your second"
    }
}

extension StoryViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        print(model)
    }
}
