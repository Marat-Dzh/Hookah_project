//
//  UserProfileProtocols.swift
//  HookahProject
//
//  Created by Олег Филатов on 30.11.2020.
//

import Foundation

protocol UserProfileModuleInput: class {
    func setInfo(info: UserInfo?)
}

protocol UserProfileModuleOutput: class {
    func signOut()
}

protocol UserProfileViewInput: class{
    func showUserInfo(info: UserInfo)
    func showNothing()
}

protocol UserProfileViewOutput : class {
    func onLogoutTapped()
}

protocol UserProfileInteractorInput {
    func getUserInfo() ->UserInfo?
    func setInfoEntity(info: UserInfo)
    func logout()
}

protocol UserProfileInteractorOutput: class {
    func userSignedOut()
}

protocol UserProfileRouterInput: class {
}

protocol UserProfileRouterOutput: class {
    
}


