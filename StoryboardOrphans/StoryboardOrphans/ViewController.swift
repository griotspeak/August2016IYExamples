//
//  ViewController.swift
//  StoryboardOrphans
//
//  Created by TJ Usiyan on 2016/09/09.
//  Copyright © 2016 Buttons and Lights LLC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func go(_ sender: AnyObject) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let labelledViewController = storyboard.instantiateViewController(withIdentifier: "LabelledVC") as! LabelledViewController
        labelledViewController.textToDisplay = "It's Alive! Alive! MWAHAHAHAHAHAH!!!!!!"
        show(labelledViewController, sender: nil)
        

    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

