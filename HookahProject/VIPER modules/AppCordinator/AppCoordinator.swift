//
//  AppCoordinator.swift
//  HookahProject
//
//  Created by Олег Филатов on 03.11.2020.
//

import UIKit

class AppCoordinator {

    private let window: UIWindow
    private lazy var tabBarController = UITabBarController()
    private lazy var navigationControllers = AppCoordinator.makeNavigationControllers()
    
    init(window: UIWindow){
        self.window = window
        self.setupAppearance()
    }
    
    func start(){
        self.setupBooking()
        self.setupBasket()
        let navigationControllers = NavControllerType.allCases.compactMap{
            self.navigationControllers[$0]
        }
        self.tabBarController.setViewControllers(navigationControllers, animated: true)
        self.window.rootViewController = self.tabBarController
        window.makeKeyAndVisible()
    }
    
}

private extension AppCoordinator {
    
    func setupBooking(){
        guard let navController = self.navigationControllers[.menu] else {
            fatalError("can't finid navController")
        }
        let context = BookingContext(output: nil)
        let container = BookingContainer.assemble(context: context)
        navController.setViewControllers([container.viewController], animated: false)
        container.viewController.navigationItem.title = NavControllerType.menu.title
    }
    
    private func setupBasket(){
        guard let navController = self.navigationControllers[.basket] else {
            fatalError("can't finid navController")
        }
        let viewController = UIViewController()
        viewController.view.backgroundColor = .brown
        navController.setViewControllers([viewController], animated: false)
        viewController.navigationItem.title = NavControllerType.basket.title
    }
    
    func setupAppearance(){
        UINavigationBar.appearance().barTintColor = .gray
        UINavigationBar.appearance().tintColor = .black

        if #available(iOS 13.0, *) {
            let appearance = UINavigationBarAppearance()
            appearance.backgroundColor = .gray

            UINavigationBar.appearance().tintColor = .white
            UINavigationBar.appearance().standardAppearance = appearance
            UINavigationBar.appearance().compactAppearance = appearance
            UINavigationBar.appearance().scrollEdgeAppearance = appearance
        } else {
            UINavigationBar.appearance().tintColor = .gray
            UINavigationBar.appearance().barTintColor = .purple
            UINavigationBar.appearance().isTranslucent = false
        }
        UINavigationBar.appearance().shadowImage = UIImage()

        UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]

        UITabBar.appearance().barTintColor = .gray
        UITabBar.appearance().tintColor = .black
    }
    
    static func makeNavigationControllers() -> [NavControllerType : UINavigationController] {
        var result: [NavControllerType : UINavigationController] = [:]
        NavControllerType.allCases.forEach{NavControllerType in
            let navigationController = UINavigationController()
            let tabBarItem =  UITabBarItem(title: NavControllerType.title,
                                           image: NavControllerType.image,
                                           tag: NavControllerType.rawValue)
            navigationController.tabBarItem = tabBarItem
            navigationController.navigationBar.prefersLargeTitles = true // большой титульник, если возомжно
            result[NavControllerType] = navigationController
        }
        return result
    }
}

fileprivate enum NavControllerType: Int, CaseIterable {
    case feed, basket, menu, account
    
    var title: String{
        switch self {
        case .feed:
            return Localization.feed
        case .menu:
            return Localization.menu
        case .basket:
            return Localization.basket
        case .account:
            return Localization.account
        }
    }
    
    var image: UIImage? {
        switch self {
        case .feed:
            return UIImage(named: "list.bulet")
        case .menu:
            return UIImage(named: "list.bulet")
        case .basket:
            return UIImage(named: "list.bulet")
        case .account:
            return UIImage(named: "list.bulet")
        }
    }
}
