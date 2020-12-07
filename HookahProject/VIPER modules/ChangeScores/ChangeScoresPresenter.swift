//
//  ChangeScoresPresenter.swift
//  HookahProject
//
//  Created by Олег Филатов on 04.12.2020.
//

import UIKit

class ChangeScoresPresenter {
    weak var view: ChangeScoresViewInput?
    
    private let router: ChangeScoresRouter
    private let interactor: ChangeScoresInteractor
    
    init(router: ChangeScoresRouter, interactor: ChangeScoresInteractor){
        self.router = router
        self.interactor = interactor
    }
}

extension ChangeScoresPresenter: ChangeScoresViewOutput {
    
}

extension ChangeScoresPresenter: ChangeScoresInteractorOutput {
    
}

extension ChangeScoresPresenter: ChangeScoresModuleInput {
    
}

extension ChangeScoresPresenter: ChangeScoresRouterOutput {
    
}
