//
//  UserProfileProtocols.swift
//  HookahProject
//
//  Created by Олег Филатов on 30.11.2020.
//

import Foundation

protocol UserProfileModuleInput: class {
    
}

protocol UserProfileModuleOutput: class {
    func signOut()
}

protocol UserProfileViewInput: class{
    func showUserInfo(info: UserInfo)
    func showNothing()
}

protocol UserProfileViewOutput : class {
    func showInfo()
    func onLogoutTapped()
}

protocol UserProfileInteractorInput {
    func getUserInfo() ->UserInfo?
    func logout()
}

protocol UserProfileInteractorOutput: class {
    func userSignedOut()
}

protocol UserProfileRouterInput: class {
}

protocol UserProfileRouterOutput: class {
    
}


