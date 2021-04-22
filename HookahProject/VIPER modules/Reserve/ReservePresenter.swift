//
//  ReservePresenter.swift
//  HookahProject
//
//  Created by Олег Филатов on 28.11.2020.
//

import UIKit

final class ReservePresenter {
    weak var view: ReserveViewInput?
    weak var moduleOutput: ReserveModuleOutput?
    
    private let router: ReserveRouterInput
    private let interactor: ReserveInteractorInput
    
    init(router: ReserveRouterInput, interactor: ReserveInteractorInput) {
        self.router = router
        self.interactor = interactor
    }
    
    
}


extension ReservePresenter: ReserveViewOutput {
    func addReserve(date: Date, numGuest: Int) {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "RU-ru")
        dateFormatter.dateFormat = "dd.MM.yy"
        dateFormatter.dateStyle = .short
        dateFormatter.timeStyle = .short
        dateFormatter.timeZone = TimeZone.current
        let dateString = dateFormatter.string(from: date)
//        dateString = String(dateString.dropLast(5))
        let numGuest = String(describing: numGuest)
        self.router.suссessReserve1(dateString: dateString, numGuest: numGuest) { [weak self] (dateString1, numGuest1) in
            guard let self = self else { return }
            self.interactor.reserveTime(dateString: dateString1, numGuest: numGuest1)
        }
    }
    
    func showErrorReserve() {
        self.router.errorReserve()
    }
}

extension ReservePresenter: ReserveInteractorOutput {
    func didFinish() {
        // ошбика подключение к FireBase
    }
}

extension ReservePresenter: ReserveModuleInput {
    
}

