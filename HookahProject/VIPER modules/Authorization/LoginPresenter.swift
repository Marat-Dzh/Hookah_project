//
//  LoginPresenter.swift
//  HookahProject
//
//  Created by Nikita Kuznetsov on 23.10.2020.
//

import Foundation

final class LoginPresenter{
    weak var view: LoginViewInput?
    weak var moduleOutput: LoginModuleOutput?
    private let router: LoginRouterInput
    private let interactor: LoginInteractorInput
    
    init(_ router:LoginRouterInput,_ interactor:LoginInteractorInput){
        self.interactor = interactor
        self.router = router
    }
}

extension LoginPresenter: LoginModuleInput{
    
}
extension LoginPresenter: LoginViewInput{
    
}

extension LoginPresenter: LoginViewOutput{
    func onClose() {
        /* View method */
    }
    
    func onSkip() {
        router.loginBySkip()
    }
    
    func login(type: AuthType, data: LoginData) {
        interactor.login(type: type, context: data)
    }
}

extension LoginPresenter: LoginInteractorOutput{
    func authorizationCompleted() {
        router.loginByPhone()
    }
    
    func gotError() {
        //View method
    }
}
