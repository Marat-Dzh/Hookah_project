//
//  BasketInteractor.swift
//  HookahProject
//
//  Created by Олег Филатов on 15.11.2020.
//

import Foundation

final class BasketInteractor{
    weak var presenter: BasketInteractorOutput?
    
}

extension BasketInteractor: BasketInteractorInput{
    func addToBasket() {
        //
    }
    
    func getCatalog() {
        //getting catalog from firebase database
        presenter?.makeModels()
    }
}
