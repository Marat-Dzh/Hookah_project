//
//  ConfirmProtocols.swift
//  HookahProject
//
//  Created by Nikita Kuznetsov on 26.12.2020.
//

import Foundation

protocol ConfirmViewInput: class{
    func showError(message: String)
    func showInfo(info: String)
}

protocol ConfirmViewOutput : class{
    func onConfirmTapped(context: PhoneData)
    func onResendTapped()
    func viewDidLoad()
}

protocol ConfirmModuleInput{
    
}

protocol ConfirmModuleOutput: class{
    func loginBySMS(context: PhoneData)
}

protocol ConfirmInteractorInput{
    func resendMessage()
    func getInfo() -> String
}

protocol ConfirmInteractorOutput: class{
    func gotError(_ error: String)
}

protocol ConfirmRouterInput{
    
}
