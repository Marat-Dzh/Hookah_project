//
//  UserProfilePresenter.swift
//  HookahProject
//
//  Created by Олег Филатов on 30.11.2020.
//

import  UIKit

final class UserProfilePresenter {
    weak var view: UserProfileViewInput?
    private let router: UserProfileRouter
    private let interactor: UserProfileInteractor
    
    init(router: UserProfileRouter, interactor: UserProfileInteractor) {
        self.router = router
        self.interactor = interactor
    }
    
}

extension UserProfilePresenter: UserProfileViewOutput {
    func showInfo() {
        let info = interactor.getUserInfo()
        if info != nil {
            view?.showUserInfo(info: info!)
        } else {
            view?.showNothing()
        }
    }
    func onLogoutTapped() {
        interactor.logout()
    }
}

extension UserProfilePresenter: UserProfileInteractorOutput {
    
}

extension UserProfilePresenter: UserProfileModuleInput {
    
}

extension UserProfilePresenter: UserProfileRouterOutput {
    
}
