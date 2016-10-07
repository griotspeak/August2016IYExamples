//
//  AppDelegate.swift
//  ViewLifecycle
//
//  Created by TJ Usiyan on 2016/04/10.
//  Copyright © 2016 Buttons and Lights LLC. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        print("❎begin AppDelegate.applicationDidFinishLaunchingWithOptions")

        let viewController = window!.rootViewController as! MessageViewController

        print("❎setting message")
        viewController.message = "some new correct message"


        print("❎end AppDelegate.applicationDidFinishLaunchingWithOptions")
        return true
    }
}

