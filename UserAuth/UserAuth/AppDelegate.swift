//
//  AppDelegate.swift
//  UserAuth
//
//  Created by TJ Usiyan on 2016/04/10.
//  Copyright © 2016 Buttons and Lights LLC. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

        let storyboard = UIStoryboard(name: "Main", bundle: nil)

        let loginVC = storyboard.instantiateViewController(withIdentifier: "LoginViewController")
        let loginViewController = loginVC as! LoginViewController

        let firstVC = window!.rootViewController as! FirstContentViewController
        loginViewController.delegate = firstVC
        window?.makeKeyAndVisible()
        window?.rootViewController?.present(loginViewController, animated: false, completion: nil)

        return true
    }
}

