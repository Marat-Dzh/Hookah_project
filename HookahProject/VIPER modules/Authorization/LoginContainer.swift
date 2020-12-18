//
//  LoginContainer.swift
//  HookahProject
//
//  Created by Nikita Kuznetsov on 23.10.2020.
//

import Foundation
import UIKit

final class LoginContainer{
    let input: LoginModuleInput
    let viewController: UIViewController
    
    class func assemble(context: LoginContext)-> LoginContainer{
        let router = LoginRouter()
        let interactor = LoginInteractor()
        let presenter = LoginPresenter(router, interactor)
        let viewController = LoginViewController_v(output: presenter)
        
        presenter.view = viewController
        presenter.moduleOutput = context.output
        
        interactor.presenter = presenter
        
        return LoginContainer(view: viewController, input: presenter)
    }
    
    private init(view: UIViewController, input: LoginModuleInput){
        self.input = input
        self.viewController = view
    }
}

struct LoginContext {
    weak var output: LoginModuleOutput?
}
