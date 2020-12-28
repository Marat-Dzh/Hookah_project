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
    
    private var arrayReserves = [TableReserveModel]()
    private var arrayPersonInfo = [PersonInfo]()
    
    init(router: TableReserveRouter, interactor: TableReserveInteractor) {
        self.router = router
        self.interactor = interactor
    }
}


extension TableReservePresenter: TableReserveInteractorOutput {
    func makeReserve(arrayDicts: [[String : Any]]) {
        print("array Dicts reserve \(arrayDicts)")
        for arrayDict in arrayDicts {
            var helpArrayReserve = TableReserveModel(numberGuest: "", timeReserve: "", phoneNumber: "", isConfirmation: false)
            let helpArrayPersonInfo = PersonInfo("", "mail@.ru", "123")
            for (key, value) in arrayDict{
                if (key == "guests") {
                    helpArrayReserve.numberGuest = String(describing: value)
                } else if (key == "date") {
                    helpArrayReserve.timeReserve = String(describing: value)
                } else if (key == "phone") {
                    helpArrayReserve.phoneNumber = String(describing: value)
                } else if (key == "name") {
                    helpArrayPersonInfo.fio = String(describing: value)
                }
            }
            self.arrayReserves.append(helpArrayReserve)
            self.arrayPersonInfo.append(helpArrayPersonInfo)
        }
        self.view?.set(viewModelsReserve: arrayReserves, viewModelsInfo: arrayPersonInfo)
    }
}

extension TableReservePresenter: TableReserveViewOutput {
    func deleteReserve() {
        self.interactor.deleteReserveFromFB()
    }
    
    func viewDidLoad() {
        self.interactor.getReserve()
    }
    
    func changeConfirmation() {
        self.interactor.changeConfirmationInFB()
    }
    
}

extension TableReservePresenter: TableReserveModuleInput {
    
}

extension TableReservePresenter: TableReserveRouterOutput{
    
}

