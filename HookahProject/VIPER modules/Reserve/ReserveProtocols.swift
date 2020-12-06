//
//  ReserveProtocols.swift
//  HookahProject
//
//  Created by Олег Филатов on 28.11.2020.
//

import Foundation

protocol ReserveModuleInput: class {
    
}

protocol ReserveModuleOutput: class {
    
}

protocol ReserveViewInput: class {
    func suссessReserve() 
    func errorReserve()
}

protocol ReserveViewOutput : class {
    func addReserve()
}

protocol ReserveInteractorInput {
    func sentReservePresentInteractor()
}

protocol ReserveInteractorOutput: class {
    func didFinish()
}

protocol ReserveRouterInput: class {

}

protocol ReserveRouterOutput: class {
    
}
