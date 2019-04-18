//
//  AppDelegate.swift
//  FRKit
//
//  Created by free on 2019/4/15.
//  Copyright © 2019 free. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        setupWindow()
        
        return true
    }

    private func setupWindow() {
        let basicViewCtrl = BasicViewController()
        let basicNavigationCtrl = FRBasicNavigationController.init(rootViewController: basicViewCtrl)
        
        window = UIWindow.init(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.rootViewController = basicNavigationCtrl
    }

}

