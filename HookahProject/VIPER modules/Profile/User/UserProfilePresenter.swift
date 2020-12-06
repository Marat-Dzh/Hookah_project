//
//  UserProfilePresenter.swift
//  HookahProject
//
//  Created by Олег Филатов on 30.11.2020.
//

import  UIKit

final class UserProfilePresenter {
    weak var view: UserProfileViewOutput?
    
    private let router: UserProfileRouter
    private let interactor: UserProfileInteractor
    
    init(router: UserProfileRouter, interactor: UserProfileInteractor) {
        self.router = router
        self.interactor = interactor
    }
    
}

extension UserProfilePresenter: UserProfileViewOutput {
    
}

extension UserProfilePresenter: UserProfileInteractorOutput {
    
}

extension UserProfilePresenter: UserProfileModuleInput {
    
}

extension UserProfilePresenter: UserProfileRouterOutput {
    
}
