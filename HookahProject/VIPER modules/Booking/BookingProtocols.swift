//
//  BookingProtocols.swift
//  HookahProject
//
//  Created by Nikita Kuznetsov on 19.10.2020.
//

import Foundation

protocol BookingViewInput: class{
    
}

protocol BookingViewOutput : class{
    func onComponentAdded()
    func onConfirmTap()
    func onConstructorTap()
}

protocol BookingModuleInput{
    
    
}

protocol BookingModuleOutput: class{
    
}

protocol BookingInteractorInput{
    func addComponent()
    func confirmOrder()
}

protocol BookingInteractorOutput: class{
    func confirmAdding()
    func confirmNewOrder()
}

protocol BookingRouterInput{
    func openConstructor()
}
