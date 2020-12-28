//
//  TableReserveProtocols.swift
//  HookahProject
//
//  Created by Олег Филатов on 02.12.2020.
//

import Foundation

protocol TableReserveModuleInput: class {
    
}

protocol TableReserveModuleOutput: class {
    
}

protocol TableReserveViewInput: class {
    func set(viewModelsReserve: [TableReserveModel], viewModelsInfo : [PersonInfo])
}

protocol TableReserveViewOutput : class {
    func viewDidLoad()
    func deleteReserve()
    func changeConfirmation()
}

protocol TableReserveInteractorInput {
    func getReserve()
    func deleteReserveFromFB()
    func changeConfirmationInFB()
}

protocol TableReserveInteractorOutput: class {
    func makeReserve(arrayDicts: [[String : Any]])
}

protocol TableReserveRouterInput: class {
    
}

protocol TableReserveRouterOutput: class {
    
}
