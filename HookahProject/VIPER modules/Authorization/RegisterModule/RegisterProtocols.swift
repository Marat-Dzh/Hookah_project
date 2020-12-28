//
//  RegisterProtocols.swift
//  HookahProject
//
//  Created by Nikita Kuznetsov on 26.12.2020.
//

import Foundation

protocol RegisterViewInput: class{
    func showError(message: String)
}

protocol RegisterViewOutput : class{
    func onConfirmTapped(context: PhoneData)
}

protocol RegisterModuleInput{
    
}

protocol RegisterModuleOutput: class{
    func loginBySMS(context: PhoneData)
}

protocol RegisterInteractorInput{
    func login(type: AuthType, context: LoginData)
    func register (type: AuthType, data: LoginData)
    func checkActiveSession()
    func getVerificationID(phoneNumber: String)
}

protocol RegisterInteractorOutput: class{
    func gotError(_ error: String)
}

protocol RegisterRouterInput{
    
}


