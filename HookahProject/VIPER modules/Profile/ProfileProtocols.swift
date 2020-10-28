//
//  ProfileProtocols.swift
//  HookahProject
//
//  Created by Nikita Kuznetsov on 19.10.2020.
//

import Foundation

protocol ProfileViewInput: class{
    func displayInfo()
}

protocol ProfileViewOutput : class{
    func onLogoutTap()
    func onMakeContactTap()
    func onInfoChanged()
}

protocol ProfileModuleInput{
    
    func showUserInfo()
}

protocol ProfileModuleOutput: class{
    
}

protocol ProfileInteractorInput{
    func changeInfo()
}

protocol ProfileInteractorOutput: class{
    func didFinish()
}

protocol ProfileRouterInput{
    func logout()
}
