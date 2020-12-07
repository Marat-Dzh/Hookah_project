//
//  LoginProtocols.swift
//  HookahProject
//
//  Created by Nikita Kuznetsov on 19.10.2020.
//

import Foundation

protocol LoginViewInput: class{
    func showError(message: String)
}

protocol LoginViewOutput : class{
    func onClose()
    func onSkip()
    func login(type: AuthType, data: LoginData)
    func register(type: AuthType, data: LoginData)
    func checkSession()
}

protocol LoginModuleInput{
    
}

protocol LoginModuleOutput: class{
    func onClose()
    func didFinish()
    
}

protocol LoginInteractorInput{
    func login(type: AuthType, context: LoginData)
    func register (type: AuthType, data: LoginData)
    func checkActiveSession()
}

protocol LoginInteractorOutput: class{
    func authorizationCompleted(context: AuthContext)
    func gotError(_ error: ErrorType)
}

protocol LoginRouterInput{
    func loginByPhone(context: AuthContext)
    func loginBySkip()
}
