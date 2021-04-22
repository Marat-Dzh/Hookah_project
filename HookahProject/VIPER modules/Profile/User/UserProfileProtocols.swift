//
//  UserProfileProtocols.swift
//  HookahProject
//
//  Created by Олег Филатов on 30.11.2020.
//

import Foundation
import UIKit

protocol UserProfileModuleInput: class {
    func setInfo(info: UserInfo?)
}

protocol UserProfileModuleOutput: class {
    func signOut()
}

protocol UserProfileViewInput: class{
    func downloadImageProfile(url: URL)
    func showUserInfo(info: UserInfo)
    func showNothing()
}

protocol UserProfileViewOutput : class {
    func dowloadImageProfile()
    func uploadImage(image: UIImage)
    func onLogoutTapped()
    func didTapButtonChangeScorese()
    func didTapButtonReserve()
    func didTapButtonToConnect()
    func didTapButtonShowMap()
    func didTapButtonToInstagram()
}

protocol UserProfileInteractorInput {
    func getUserInfo() ->UserInfo?
    func setInfoEntity(info: UserInfo)
    func uploadImageInFB(image: Data)
    func downloadImageFromFB()
    func logout()
}

protocol UserProfileInteractorOutput: class {
    func userSignedOut()
    func downloadURLImageProfile(url: URL)
}

protocol UserProfileRouterInput: class {
    func showChangeScores()
    func showTableReserve()
    func callNumber()
    func showMap()
    func openInstagram()
}

protocol UserProfileRouterOutput: class {
    
}


