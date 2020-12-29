//
//  ReserveInteractor.swift
//  HookahProject
//
//  Created by Олег Филатов on 28.11.2020.
//

import Foundation

final class ReserveInteractor {
    var output: ReserveInteractorOutput?
    
}

extension ReserveInteractor: ReserveInteractorInput {
    func sentReservePresentInteractor() {
        //принимает данные от резерва в какую-то струкутру
        //output?.didFinish()
    }
}
