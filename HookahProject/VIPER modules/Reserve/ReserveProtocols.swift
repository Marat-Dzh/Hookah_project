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
    
    
}

protocol ReserveViewOutput : class {
    func addReserve(date: Date, numGuest: Int)
    func showErrorReserve() 
}

protocol ReserveInteractorInput {
    func reserveTime(dateString: String, numGuest: String)
}

protocol ReserveInteractorOutput: class {
    func didFinish()
}

protocol ReserveRouterInput: class {
    func suссessReserve1(dateString: String, numGuest: String, completion: @escaping (String, String) -> Void)
    func errorReserve()
}

protocol ReserveRouterOutput: class {
    
}
