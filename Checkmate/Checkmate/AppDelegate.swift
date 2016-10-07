//
//  AppDelegate.swift
//  Checkmate
//
//  Created by TJ Usiyan on 2016/05/10.
//  Copyright © 2016 Buttons and Lights LLC. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

        window?.makeKeyAndVisible()
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let loginVC = storyboard.instantiateViewController(withIdentifier: "LoginVC") as! LoginViewController
        let navController = UINavigationController(rootViewController: loginVC)

        let rootVC = window!.rootViewController as! ViewController
        rootVC.present(navController, animated: false, completion: nil)
        loginVC.delegate = rootVC

        return true
    }
}

