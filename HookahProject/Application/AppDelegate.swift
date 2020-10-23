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
        let context = LoginContext(output: nil)
        let loginContainer = LoginContainer.assemble(context: context)
        window.rootViewController = loginContainer.viewController
        window.makeKeyAndVisible()
        self.window = window
        return true
    }

}

