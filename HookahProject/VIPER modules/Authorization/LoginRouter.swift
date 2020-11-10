//
//  LoginRouter.swift
//  HookahProject
//
//  Created by Nikita Kuznetsov on 23.10.2020.
//

import Foundation
import UIKit

final class LoginRouter{
    
}

extension LoginRouter: LoginRouterInput{
    func loginByPhone(context: AuthContext) {
        
        let window = UIApplication.shared.windows[0]
        let appCoordinator = AppCoordinator(window: window)
        appCoordinator.start()
    }
    
    func loginBySkip() {
        //assemble feed module without user class
    }
    
    
}
