//
//  TableReservePresenter.swift
//  HookahProject
//
//  Created by Олег Филатов on 02.12.2020.
//

import UIKit

final class TableReservePresenter {
    weak var view: TableReserveViewInput?
    
    private let router: TableReserveRouterInput
    private let interactor: TableReserveInteractorInput
    
    init(router: TableReserveRouter, interactor: TableReserveInteractor) {
        self.router = router
        self.interactor = interactor
    }
}


extension TableReservePresenter: TableReserveViewOutput {
    
}

extension TableReservePresenter: TableReserveInteractorOutput {
    
}

extension TableReservePresenter: TableReserveModuleInput {
    
}

extension TableReservePresenter: TableReserveRouterOutput{
    
}

