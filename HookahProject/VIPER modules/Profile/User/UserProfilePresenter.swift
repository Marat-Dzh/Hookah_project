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
    func onLogoutTapped() {
        interactor.logout()
    }
}

extension UserProfilePresenter: UserProfileInteractorOutput {
    func userSignedOut(){
        moduleOutput?.signOut()
    }
}

extension UserProfilePresenter: UserProfileModuleInput {
    func setInfo(info: UserInfo?) {
        if info != nil {
            interactor.setInfoEntity(info: info!)
            view?.showUserInfo(info: info!)
        } else {
            view?.showNothing()
        }
    }
}

extension UserProfilePresenter: UserProfileRouterOutput {
    
}
