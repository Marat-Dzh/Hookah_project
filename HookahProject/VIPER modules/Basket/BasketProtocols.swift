//
//  BasketProtocols.swift
//  HookahProject
//
//  Created by Nikita Kuznetsov on 19.10.2020.
//

import Foundation

protocol BasketViewInput: class{
    func displayOrders(basketViewModels: [BasketCardViewModel])
}

protocol BasketViewOutput : class{
    func viewDidLoad()
//    func onHistoryShowTap()
//    func onConfirmOrderTap()
}

protocol BasketModuleInput{
    
    //func listOrders()
}

protocol BasketModuleOutput: class{
    
}

protocol BasketInteractorInput{
    func getCatalog()
}

protocol BasketInteractorOutput: class{
    func makeModels()
}

protocol BasketRouterInput{
    //func openConfirmModule()
}
