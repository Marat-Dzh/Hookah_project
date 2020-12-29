//
//  LoginRouter.swift
//  HookahProject
//
//  Created by Nikita Kuznetsov on 23.10.2020.
//

import Foundation
import UIKit
    
final class LoginRouter{
    weak var presenter: LoginRouterOutput?
    weak var navigationControllerProvider: UIViewController?
}

extension LoginRouter: LoginRouterInput{
    func assembleRegisterModule() {
        let context = RegisterContext(output: self)
        let container = RegisterContainer.assemble(context: context)
        self.navigationControllerProvider?.present(container.viewController, animated: true, completion: nil)
    }
    func assembleConfirmModule(_ phoneNumber: String,  _ module:ConfirmModuleOutput) {
        let context = ConfirmContext(moduleOutput: module, number: phoneNumber)
        let container = ConfirmContainer.assemble(context: context)
        self.navigationControllerProvider?.present(container.viewController, animated: true, completion: nil)
    }
}

extension LoginRouter: RegisterModuleOutput{
    func registerUser(data: RegisterData) {
        navigationControllerProvider?.dismiss(animated: true, completion: nil)
        presenter?.registerUser(data: data)
    }
}
