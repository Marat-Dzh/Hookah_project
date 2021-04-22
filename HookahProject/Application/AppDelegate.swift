//
//  AppDelegate.swift
//  HookahProject
//
//  Created by Nikita Kuznetsov on 18.10.2020.
//
import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    private lazy var appCoordinator = AppCoordinator()

    let notificationCenter = UNUserNotificationCenter.current()
    let notifications = Notifications()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        notifications.requestAutorization()
        notifications.notificationCenter.delegate = notifications
        
        appCoordinator.start()
        return true
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        UIApplication.shared.applicationIconBadgeNumber = 0
    }
}

