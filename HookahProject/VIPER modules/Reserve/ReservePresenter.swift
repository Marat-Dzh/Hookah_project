//
//  ReservePresenter.swift
//  HookahProject
//
//  Created by Олег Филатов on 28.11.2020.
//

import UIKit

final class ReservePresenter {
    weak var view: ReserveViewInput?
    
    private let router: ReserveRouter
    private let interactor: ReserveInteractor
    
    init(router: ReserveRouter, interactor: ReserveInteractor) {
        self.router = router
        self.interactor = interactor
    }
}


extension ReservePresenter: ReserveViewOutput {
    
}

extension ReservePresenter: ReserveInteractorOutput {
    
}

extension ReservePresenter: ReserveModuleInput {
    
}

extension ReservePresenter: ReserveRouterOutput {
    
}
