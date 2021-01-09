//
//  AppCoordinator.swift
//  HookahProject
//
//  Created by Олег Филатов on 03.11.2020.
//
import FirebaseFirestore
import UIKit

protocol MenuCoordinatorOutput: class{
    func displayLoginModule()
}

class MenuCoordinator {
    private lazy var tabBarController = UITabBarController()
    private lazy var navigationControllers = MenuCoordinator.makeNavigationControllers()
    private var window: UIWindow
    private var userContext: UserContext?
    private weak var appCoordinator: MenuCoordinatorOutput?
    
    private weak var account: UserProfileModuleInput?
    private weak var feed: FeedModuleInput?
    private weak var booking: BookingModuleInput?
    private weak var reserve: ReserveModuleInput?
    
    init(context: UserContext? = nil, window: UIWindow, appParent: MenuCoordinatorOutput?){
        userContext = context
        self.appCoordinator = appParent
        self.window = window
        self.setupAppearance()
        
    }
    
    func setUserContext(context: UserContext?){
        self.userContext = context
        account?.setInfo(info: context?.info)
        
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
        let vc = self.window.rootViewController?.children
        if vc != nil || vc?.count ?? 0 > 1{
            for item in vc!{
                item.dismiss(animated: true, completion: nil)
            }
        }
        self.window.rootViewController = self.tabBarController
        window.makeKeyAndVisible()
    }
    
}

private extension MenuCoordinator {
    
    func setupBooking(){
        guard let navController = self.navigationControllers[.menu] else {
            fatalError("can't finid navController")
        }
        let context = BookingContext(moduleOutput: nil)
        let container = BookingContainer.assemble(context: context)
        booking = container.input
        navController.setViewControllers([container.viewController], animated: false)
        container.viewController.navigationItem.title = NavControllerType.menu.title
    }
  
    func setupFeed(){
        guard let navController = self.navigationControllers[.feed] else {
            fatalError("can't finid navController")
        }
        let feedContainer = FeedContainer.assemble(context: FeedContext(output: nil))
        feed = feedContainer.input
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
        reserve = reserveContainer.moduleInput
    }

    func setupAccount(){
    guard let navController = self.navigationControllers[.account] else {
    fatalError("can't finid navController")
    }
        let context = UserProfileContext(userInfo: userContext?.info, output: self)
        let userProfileContainer = UserProfileContainer.assemble(userInfo: context)
        account = userProfileContainer.moduleInput
    navController.setViewControllers([userProfileContainer.viewController], animated: false)
    userProfileContainer.viewController.navigationItem.title = NavControllerType.account.title
    }
    
    
    func setupAppearance() {
        UINavigationBar.appearance().barTintColor = .black
        UINavigationBar.appearance().tintColor = .white

        if #available(iOS 13.0, *) {
            let appearance = UINavigationBarAppearance()
            appearance.backgroundColor = .black
            appearance.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
            appearance.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]

            UINavigationBar.appearance().tintColor = .white
            UINavigationBar.appearance().standardAppearance = appearance
            UINavigationBar.appearance().compactAppearance = appearance
            UINavigationBar.appearance().scrollEdgeAppearance = appearance
        } else {
            UINavigationBar.appearance().tintColor = .white
            UINavigationBar.appearance().barTintColor = .purple
            UINavigationBar.appearance().isTranslucent = false
            UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
            UINavigationBar.appearance().largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        }
        UINavigationBar.appearance().shadowImage = UIImage()
    

        

        UITabBar.appearance().barTintColor = .black
        UITabBar.appearance().tintColor = .white
        UITabBar.appearance().unselectedItemTintColor = .gray
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
            return UIImage(named: "reserve")
        case .account:
            return UIImage(named: "account")
        }
    }
}

extension MenuCoordinator: UserProfileModuleOutput{
    func signOut(){
        appCoordinator?.displayLoginModule()
    }
}
