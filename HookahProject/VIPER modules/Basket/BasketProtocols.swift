//
//  BasketProtocols.swift
//  HookahProject
//
//  Created by Nikita Kuznetsov on 19.10.2020.
//

import Foundation

protocol BasketViewInput: class{
    func displayOrders()
}

protocol BasketViewOutput : class{
    func onHistoryShowTap()
    func onConfirmOrderTap()
}

protocol BasketModuleInput{
    
    func listOrders()
}

protocol BasketModuleOutput: class{
    
}

protocol BasketInteractorInput{
    
}

protocol BasketInteractorOutput: class{
    
}

protocol BasketRouterInput{
    func openConfirmModule()
}
