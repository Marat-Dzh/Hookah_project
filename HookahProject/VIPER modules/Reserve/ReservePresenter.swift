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
    
    init(router: ReserveRouterInput, interactor: ReserveInteractorInput) {
        self.router = router
        self.interactor = interactor
    }
    
    
}


extension ReservePresenter: ReserveViewOutput {
    func addReserve(date: Date, numGuest: Int) {
        var dateString = String(describing: date)
        dateString = String(dateString.dropLast(5))
        let numGuest = String(describing: numGuest)
        self.interactor.reserveTime(dateString: dateString, numGuest: numGuest)
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
