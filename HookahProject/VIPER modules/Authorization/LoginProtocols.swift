//
//  LoginProtocols.swift
//  HookahProject
//
//  Created by Nikita Kuznetsov on 19.10.2020.
//

import Foundation

protocol LoginViewInput: class{
    
}

protocol LoginViewOutput : class{
    func onClose()
    func onSkip()
    func login(type: AuthType, data: LoginData)
    
}

protocol LoginModuleInput{
    
}

protocol LoginModuleOutput: class{
    func onClose()
    func didFinish(result: AuthenticationResult)
    
}

protocol LoginInteractorInput{
    func login(type: AuthType, context: LoginData)
}

protocol LoginInteractorOutput: class{
    func authorizationCompleted()
    func gotError()
}

protocol LoginRouterInput{
    func loginByPhone()
    func loginBySkip()
}
