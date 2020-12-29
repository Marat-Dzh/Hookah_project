//
//  AppCoordinator.swift
//  HookahProject
//
//  Created by Nikita Kuznetsov on 11.12.2020.
//

import Foundation
import UIKit
import Firebase
import FirebaseFirestore

final class AppCoordinator{
    var window: UIWindow = UIWindow()
    var menuCoordinator: MenuCoordinator?
    func start() {
        FirebaseApp.configure()
        displayLoginModule()
    }
}

extension AppCoordinator: LoginModuleOutput{
    func loginByPhone(context: AuthContext) {
        menuCoordinator = MenuCoordinator(window: window, appParent: self)
        getPersonContext(context: context)
        menuCoordinator?.start()
    }
    func loginBySkip() {
        //
    }
    
    
}

private extension AppCoordinator{
    func getPersonContext(context: AuthContext){
        if context.personType == .unknown{
            menuCoordinator?.setUserContext(context: nil)
            return
        }
        let db = Firestore.firestore()
        let docRef = db.collection("users").document(context.id)
        docRef.getDocument { [weak self] (document, error)  in
            if let document = document, document.exists {
                let userInfo = UserInfo(doc: document)
                self?.menuCoordinator?.setUserContext(context: UserContext(info: userInfo, history: [], orders: []))
            } else {
                print("Document does not exist")
            }
        }
    }
}

extension AppCoordinator: MenuCoordinatorOutput{
    func displayLoginModule() {
        let context = LoginContext(output: self)
        let loginContainer = LoginContainer.assemble(context: context)
        self.window.rootViewController = loginContainer.viewController
        self.window.makeKeyAndVisible()
    }
}
