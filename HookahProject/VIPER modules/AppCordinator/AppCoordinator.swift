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
    
    private let userContext: UserContext?
    
    init(window: UIWindow, context: AuthContext){
        userContext = AppCoordinatorService.getPersonContext(context: context)
        self.window = window
        self.setupAppearance()
    }
    
    func start(){
        self.setupBooking()
        self.setupBasket()
        self.setupFeed()
        self.setupAccount()
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
    
    func setupFeed(){
        guard let navController = self.navigationControllers[.feed] else {
            fatalError("can't finid navController")
        }
        let feedContainer = FeedContainer.assemble(context: FeedContext(output: nil))
        navController.setViewControllers([feedContainer.viewController], animated: false)
        feedContainer.viewController.navigationItem.title = NavControllerType.feed.title
    }
    
    func setupBasket(){
    guard let navController = self.navigationControllers[.basket] else {
    fatalError("can't finid navController")
    }
    //let basketContext = BasketContext(output: nil)
    let reserveContainer = ReserveContainer.assemble()
    navController.setViewControllers([reserveContainer.viewController], animated: false)
    reserveContainer.viewController.navigationItem.title = NavControllerType.basket.title
    }

    func setupAccount(){
    guard let navController = self.navigationControllers[.account] else {
    fatalError("can't finid navController")
    }
        let userProfileContainer = UserProfileContainer.assemble(userInfo: userContext?.info)
    navController.setViewControllers([userProfileContainer.viewController], animated: false)
    userProfileContainer.viewController.navigationItem.title = NavControllerType.account.title
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
        UITabBar.appearance().unselectedItemTintColor = .white
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
    case feed, menu, basket, account
    
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
            return UIImage(named: "news")
        case .menu:
            return UIImage(named: "catalog")
        case .basket:
            return UIImage(named: "basket")
        case .account:
            return UIImage(named: "account")
        }
    }
}
