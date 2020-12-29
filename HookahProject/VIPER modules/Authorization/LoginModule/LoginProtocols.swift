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
    func login(data: LoginData)
    func register(type: AuthType, data: LoginData)
    func checkSession()
}

protocol LoginModuleInput{
    
}

protocol LoginModuleOutput: class{
    func loginByPhone(context: AuthContext)
    func loginBySkip()
}

protocol LoginInteractorInput{
    func login(type: AuthType, context: LoginData)
    func register (type: AuthType, data: LoginData)
    func checkActiveSession()
    func getVerificationID(phoneNumber: String)
}

protocol LoginInteractorOutput: class{
    func gotError(_ error: ErrorType)
    func didSuccessLogin(context: AuthContext)
    func didSuccessCaptcha(phoneNumber: String)
}

protocol LoginRouterInput{
    func assembleConfirmModule(_ phoneNumber: String,  _ module:ConfirmModuleOutput)
}
