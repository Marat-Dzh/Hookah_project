//
//  LoginRouter.swift
//  HookahProject
//
//  Created by Nikita Kuznetsov on 23.10.2020.
//

import Foundation
import UIKit
    
final class LoginRouter{
    weak var navigationControllerProvider: UINavigationController?
}

extension LoginRouter: LoginRouterInput{
    func assembleConfirmModule(_ phoneNumber: String,  _ module:ConfirmModuleOutput) {
        let context = ConfirmContext(moduleOutput: module, number: phoneNumber)
        let container = ConfirmContainer.assemble(context: context)
        self.navigationControllerProvider?.pushViewController(container.viewController, animated: true)
    }
}
