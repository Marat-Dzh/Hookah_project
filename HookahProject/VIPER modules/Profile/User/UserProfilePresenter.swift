//
//  UserProfilePresenter.swift
//  HookahProject
//
//  Created by Олег Филатов on 30.11.2020.
//

import  UIKit

final class UserProfilePresenter {
    weak var view: UserProfileViewInput?
    weak var moduleOutput: UserProfileModuleOutput?
    private let router: UserProfileRouterInput
    private let interactor: UserProfileInteractorInput
    
    init(_ router: UserProfileRouterInput, _ interactor: UserProfileInteractorInput) {
        self.router = router
        self.interactor = interactor
    }
    
}

extension UserProfilePresenter: UserProfileViewOutput {
    func uploadImage(image: UIImage) {
        let imageData = image.jpegData(compressionQuality: 0.6)
        if let imageData = imageData {
            self.interactor.uploadImageInFB(image: imageData)
        }
    }
    
    func dowloadImageProfile() {
        self.interactor.downloadImageFromFB()
    }
    
    func onLogoutTapped() {
        self.interactor.logout()
    }
    
    func didTapButtonChangeScorese() {
        self.router.showChangeScores()
    }
    
    func didTapButtonReserve() {
        self.router.showTableReserve()
    }
    
    func didTapButtonToConnect() {
        self.router.callNumber()
    }
    
    func didTapButtonShowMap() {
        self.router.showMap()
    }
    
    func didTapButtonToInstagram() {
        self.router.openInstagram()
    }
    
}

extension UserProfilePresenter: UserProfileInteractorOutput {
    func userSignedOut(){
        moduleOutput?.signOut()
    }
    
    func downloadURLImageProfile(url: URL) {
        self.view?.downloadImageProfile(url: url)
    }
}

extension UserProfilePresenter: UserProfileModuleInput {
    func setInfo(info: UserInfo?) {
        if let info = info {
            self.interactor.setInfoEntity(info: info)
            self.view?.showUserInfo(info: info)
        } else {
            self.view?.showNothing()
        }
    }
}

extension UserProfilePresenter: UserProfileRouterOutput {
    
}
