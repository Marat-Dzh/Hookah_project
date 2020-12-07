//
//  ReservePresenter.swift
//  HookahProject
//
//  Created by Олег Филатов on 28.11.2020.
//

import UIKit

final class ReservePresenter {
    weak var view: ReserveViewInput?
    
    private let router: ReserveRouterInput
    private let interactor: ReserveInteractorInput
    
    init(router: ReserveRouter, interactor: ReserveInteractor) {
        self.router = router
        self.interactor = interactor
    }
    
    
}


extension ReservePresenter: ReserveViewOutput {
    func addReserve() {
        print("AAA")
    }
}

extension ReservePresenter: ReserveInteractorOutput {
    func didFinish() {
        // ошбика подключение к FireBase
    }
}

extension ReservePresenter: ReserveModuleInput {
    
}

extension ReservePresenter: ReserveRouterOutput {
    
}
