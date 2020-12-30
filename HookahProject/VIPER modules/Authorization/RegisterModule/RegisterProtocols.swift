//
//  RegisterProtocols.swift
//  HookahProject
//
//  Created by Nikita Kuznetsov on 26.12.2020.
//

import Foundation

protocol RegisterViewInput: class{
    func showError(errorResults: [FailureResult])
    func getDataFromView() -> RegisterData
}

protocol RegisterViewOutput : class{
    func onRegisterTapped(data: [InputSource])
}

protocol RegisterModuleInput{
    
}

protocol RegisterModuleOutput: class{
    func registerUser(data: RegisterData)
}

protocol RegisterInteractorInput{
    func checkUnique(dict: [String: InputSource], data: RegisterData)
}

protocol RegisterInteractorOutput: class{
    func checkDidSucceeded(data: RegisterData)
    func checkFailed(errorResults: [FailureResult])
}

protocol RegisterRouterInput{
    
}


