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
    func register(type: AuthType, data: LoginData) {
        interactor.register(type: type, data: data)
    }
}

extension LoginPresenter: LoginInteractorOutput{
    func gotError(_ error: ErrorType) {
        //view method
    }
    
    func authorizationCompleted(context: AuthContext){
        router.loginByPhone(context: context)
    }
}
