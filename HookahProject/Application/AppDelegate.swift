//
//  AppDelegate.swift
//  HookahProject
//
//  Created by Nikita Kuznetsov on 18.10.2020.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let window = UIWindow()
        let vc = UIViewController()
        vc.view.backgroundColor = .cyan
        window.rootViewController = vc
        window.makeKeyAndVisible()
        self.window = window
        return true
    }

}

